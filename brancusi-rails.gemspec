$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "brancusi-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "brancusi-rails"
  s.version     = BrancusiRails::VERSION
  s.authors     = ["John Brunton"]
  s.email       = ["john_brunton@hotmail.co.uk"]
  s.homepage    = "https://github.com/jbrunton/brancusi-rails"
  s.summary     = "Rails support for Brancusi.js"
  s.description = "Rails support for Brancusi.js"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "coffee-rails"
  s.add_dependency "brancusi"

  s.add_development_dependency "sqlite3"
end
