require 'spec_helper'
require 'rails/generators'

require File.expand_path('../../../../lib/generators/brancusi/route/route_generator', __FILE__)

describe Brancusi::RouteGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)
  arguments ["match '/', 'home#index'"]

  before(:all) do
    prepare_destination
    
    JS_APP_CONFIG_PATH = TMP_ROOT.join('app/assets/javascripts/app/config')

    FileUtils.mkpath JS_APP_CONFIG_PATH
    @routes_file_path = JS_APP_CONFIG_PATH.join('routes.js.coffee')
    write_file(@routes_file_path, "Application.routes.draw ->\n")
    
    run_generator
  end
  
  after(:all) do
    FileUtils.rm_rf TMP_ROOT
  end

  it "adds a view with the given name" do
    destination_root.should have_structure {
      directory 'app' do
        directory 'assets' do
          directory 'javascripts' do
            directory 'app' do
              directory 'config' do
                file 'routes.js.coffee' do
                  contains "match '/', 'home#index'"
                end
              end
            end
          end
        end
      end
    }
  end
end
