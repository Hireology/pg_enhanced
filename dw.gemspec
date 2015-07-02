require File.expand_path('../lib/dw/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'dw'
  s.version = DW::VERSION
  s.date = '2015-06-30'
  s.summary = 'Ruby client to interface with the data warehouse'
  s.description = 'Ruby client to interface with the data warehouse'
  s.authors = ["Hireology Engineering Team"]
  s.email = 'engineering@hireology.com'
  s.files = ["lib/dw.rb"]
  s.require_paths = ["lib"]
  s.homepage = 'https://github.com/hireology/dw_client'

  s.add_development_dependency("rspec", "~> 3.0")
  s.add_development_dependency("pry", "~> 0.10.1")
  s.add_development_dependency("pg", "~> 0.18.2")
end
