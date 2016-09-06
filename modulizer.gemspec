# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'modulizer/version'

Gem::Specification.new do |spec|
  spec.name          = "modulizer"
  spec.version       = Modulizer::VERSION
  spec.authors       = ["dave"]
  spec.email         = ["eyaswoo@163.com"]
  spec.summary       = "compiler for web page modules"
  spec.description   = "one easy way to develop web applications with isolated and reusable web page modules"
  spec.homepage      = "https://github.com/straightdave/modulizer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = ["modulizer"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
