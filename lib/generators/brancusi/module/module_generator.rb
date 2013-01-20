class Brancusi::ModuleGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  
  argument :actions, :type => :array, :default => [], :banner => "action action"
  
  def create_module
    template 'module.rb', File.join("app/assets/javascripts/app/modules", "#{file_name}_module.js.coffee")
  end
end
