class Brancusi::ViewGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  
  def create_module
    template 'view.rb', File.join("app/views/templates", "_#{file_name}.html.erb")
  end
end
