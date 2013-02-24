ENV["RAILS_ENV"] ||= 'test'

# $LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

# load dummy application
require File.expand_path("../dummy/config/environment", __FILE__)
require 'fileutils'
require 'rails/all'
require 'rspec/rails'

require "generator_spec/test_case"
require "generator_spec/matcher"

Dir[Pathname.new(File.expand_path('../', __FILE__)).join('support/**/*.rb')].each {|f| require f}

TMP_ROOT = Pathname.new(File.expand_path('../lib/tmp', __FILE__))

RSpec.configure do |config|
  config.include Helpers::FileSystem
end
