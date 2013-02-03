require 'spec_helper'
require 'rails/generators'

require File.expand_path('../../../../lib/generators/brancusi/module/module_generator', __FILE__)

TMP_ROOT = Pathname.new(File.expand_path('../../tmp', __FILE__))

describe Brancusi::ModuleGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)
  arguments %w(test test_method)

  before(:all) do
    prepare_destination
    run_generator
  end
  
  after(:all) do
    FileUtils.rm_rf TMP_ROOT
  end

  it "adds a module with the specified methods" do
    destination_root.should have_structure {
      directory 'app' do
        directory 'assets' do
          directory 'javascripts' do
            directory 'app' do
              directory 'modules' do
                file 'test_module.js.coffee' do
                  contains 'class Application.Modules.TestModule extends Brancusi.ApplicationModule'
                  contains 'test_method: ->'
                end
              end
            end
          end
        end
      end
    }
  end
end
