# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dynamic_parser/version"

Gem::Specification.new do |s|
  s.name                  = "dynamic_parser"
  s.version               = DynamicParser::Version::STRING
  s.platform              = Gem::Platform::RUBY
  s.required_ruby_version = ">= 2.1.0"
  s.authors               = ["Lucas Martins"]
  s.email                 = ["lucas@contaboa.com.br"]
  s.homepage              = "https://github.com/ContaBoa/dynamic_parser"
  s.summary               = "An interchangeble, compositable parser builder for Ruby"
  s.description           = "Your Dynamic Parser may be a composite of both `Stateless` and `Stateful` parsers. To build a composite/dynamic paser, first you need one or more `MicroParsers`.\nCheck https://github.com/ContaBoa/dynamic_parser for more details."
  s.license               = "LGPL-3.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  #s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  if RUBY_ENGINE=='rbx'
    s.add_dependency 'rubysl'
  end

  s.add_development_dependency "rspec", '2.14.1'
  s.add_development_dependency "rspec-mocks", '2.14.4'
  s.add_development_dependency "rspec-expectations", '2.14.4'
  s.add_development_dependency "factory_girl", '4.4.0'
  s.add_development_dependency "rake", '10.1.1'
  s.add_development_dependency "pry", '0.9.12.4'
  s.add_development_dependency "pry-nav", '0.2.3'
  s.add_development_dependency "yard", '0.8.7.3'
end
