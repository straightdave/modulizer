require "modulizer/version"

module Modulizer
  class Dummy
    def self.compile(mod_file = "")
      mod_name = mod_file[(mod_file.rindex('/')+1)...mod_file.rindex('.')]
      content  = File.read(mod_file)

      script   = content.match(/<script(.*?)>(.*)<\/script>/m)
      style    = content.match(/<style(.*?)>(.*)<\/style>/m)
      template = content.match(/<template(.*?)>(.*)<\/template>/m)

      script_mode   = read_attributes script[1]
      style_mode    = read_attributes style[1]
      template_mode = read_attributes template[1]

      script_content   = escape_js_variable_string script[2]
      style_content    = escape_js_variable_string style[2]
      template_content = escape_js_variable_string template[2]

      puts """/* generated js file for module:#{mod_name} */
(function(window,$){
var script =
'<script>#{script_content}</script>';

var template =
'#{template_content}';

var style =
'<style>#{style_content}</style>';

$(function(){
  $('div##{mod_name}').html(style + template + script);
});
})(window, jQuery);
"""
    end

    private
    def self.read_attributes(str = "")
      m = {}
      str.strip.split(' ').each do |item|
        (k, v) = item.split('=')
        m[k] =
        if v.nil?
          true
        elsif (v[0] != '"' && v[-1] != '"') && (v[0] != "'" && v[-1] != "'")
          raise "attributes should be in quotes"
        else
          v[1...-1]
        end
      end
      m
    end

    def self.escape_js_variable_string(str = "")
      str.gsub("\n", "\\\n")
         .gsub("'", { "'" => "\\'" })
         .gsub("\"", "\\\"")
    end
  end
end
