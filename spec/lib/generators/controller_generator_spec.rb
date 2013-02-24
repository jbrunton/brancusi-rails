require 'spec_helper'
require 'rails/generators'

require File.expand_path('../../../../lib/generators/brancusi/controller/controller_generator', __FILE__)

describe Brancusi::ControllerGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)
  arguments %w(test test_action)

  before(:all) do
    prepare_destination
    run_generator
  end
  
  after(:all) do
    FileUtils.rm_rf TMP_ROOT
  end

  it "adds a controller with the specified actions" do
    destination_root.should have_structure {
      directory 'app' do
        directory 'assets' do
          directory 'javascripts' do
            directory 'app' do
              directory 'controllers' do
                file 'test_controller.js.coffee' do
                  contains 'class Application.Controllers.TestController extends Brancusi.ApplicationController'
                  contains 'test_action: ->'
                end
              end
            end
          end
        end
      end
    }
  end
end
