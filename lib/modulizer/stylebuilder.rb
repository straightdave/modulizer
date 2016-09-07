module Modulizer
  class StyleBuilder
    def self.build(mod_name, raw_content, mode = {})
      result = "\n"
      style_items = raw_content.scan /(.*?){(.*?)}/m

      style_items.each do |s|
        selectors  = s[0].strip.delete("\n")
        principles = s[1].strip.delete("\n")

        if mode["scoped"] == true
          new_selectors = ""
          selectors.split(',').each do |s|
            new_selectors += "div##{mod_name} #{s.strip}, "
          end
          new_selectors.strip!
          new_selectors = new_selectors[0...-1] if new_selectors[-1] == ','
          selectors = new_selectors
        end

        new_principles = ""
        principles.split(";").each do |p|
          new_principles += "#{p.strip}; "
        end

        result += "#{selectors} {#{new_principles.strip}}\n"
      end
      result
    end
  end
end
