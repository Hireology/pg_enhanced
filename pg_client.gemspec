require File.expand_path('../lib/pg_enhanced/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'pg_enhanced'
  s.version = PGEnhanced::VERSION
  s.date = '2015-06-30'
  s.summary = 'Enhances pg gem (slightly)'
  s.description = 'PG gem wrapping the pg gem for baked in conveninence (json querying)'
  s.authors = ["Hireology Engineering Team"]
  s.email = 'engineering@hireology.com'
  s.files = ["lib/pg_enhanced.rb"]
  s.require_paths = ["lib"]
  s.homepage = 'https://github.com/hireology/pg_enhanced'

  s.add_development_dependency("rspec", "~> 3.0")
  s.add_development_dependency("pry", "~> 0.10.1")
  s.add_development_dependency("pg", "~> 0.18.2")
end
