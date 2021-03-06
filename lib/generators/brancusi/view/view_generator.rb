module Brancusi
  class ViewGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)
  
    def create_view
      template 'view.rb', File.join("app/views/templates", class_path, "_#{file_name}.html.erb")
    end
  end
end
