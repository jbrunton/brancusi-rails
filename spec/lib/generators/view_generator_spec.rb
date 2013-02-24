require 'spec_helper'
require 'rails/generators'

require File.expand_path('../../../../lib/generators/brancusi/view/view_generator', __FILE__)

describe Brancusi::ViewGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)
  arguments %w(foo/test)

  before(:all) do
    prepare_destination
    run_generator
  end
  
  after(:all) do
    FileUtils.rm_rf TMP_ROOT
  end

  it "adds a view with the given name" do
    destination_root.should have_structure {
      directory 'app' do
        directory 'views' do
          directory 'templates' do
            directory 'foo' do
              file '_test.html.erb' do
                contains '<h3>foo/test</h3>'
                contains '<p>Find me in <b>app/views/templates/foo/_test.html.erb</b></p>'
              end
            end
          end
        end
      end
    }
  end
end
