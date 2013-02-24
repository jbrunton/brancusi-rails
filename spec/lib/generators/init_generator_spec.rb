require 'spec_helper'
require 'rails/generators'

require File.expand_path('../../../../lib/generators/brancusi/init/init_generator', __FILE__)

describe Brancusi::InitGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)

  before(:all) do
    prepare_destination

    APP_JS_PATH = TMP_ROOT.join('app/assets/javascripts')
    APP_CONFIG_PATH = TMP_ROOT.join('config')

    FileUtils.mkpath APP_JS_PATH
    @application_js_file_path = APP_JS_PATH.join('application.js')
    write_file(@application_js_file_path, '//= require_tree .')

    FileUtils.mkpath APP_CONFIG_PATH
    @routes_file_path = APP_CONFIG_PATH.join('routes.rb')
    write_file(@routes_file_path, "ExampleApp::Application.routes.draw do\nend")

    run_generator
  end
  
  after(:all) do
    FileUtils.rm_rf TMP_ROOT
  end

  it "requires brancusi and the app to application.js" do
    destination_root.should have_structure {
      directory 'app' do
        directory 'assets' do
          directory 'javascripts' do
            file 'application.js' do
              contains '//= require brancusi'
              contains '//= require app'
            end
          end
        end
      end
    }
  end
  
  it "adds routing for a single page application served by the 'main' controller" do
    destination_root.should have_structure {
      directory 'config' do
        file 'routes.rb' do
          contains "root :to => 'main#index'"
          contains "match '/*id' => 'main#index', id: /(?!api|assets).*/"
        end
      end
    }
  end
  
  it "copies the templates in app/assets/javascripts/app" do
    destination_root.should have_structure {
      directory 'app' do
        directory 'assets' do
          directory 'javascripts' do
            directory 'app' do
              file 'index.js.coffee'
              directory 'config' do
                file 'index.js.coffee'
                file 'application.js.coffee'
                file 'bootstrapper.js.coffee'
                file 'routes.js.coffee'
              end
            end
          end
        end
      end
    }
  end
end
