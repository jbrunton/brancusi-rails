class Brancusi::ControllerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  
  argument :actions, :type => :array, :default => [], :banner => "action action"
  
  def create_controller
    template 'controller.rb', File.join("app/assets/javascripts/app/controllers", "#{file_name}_controller.js.coffee")
    actions.each do |action|
      generate('brancusi:view', "#{file_name}/#{action}")
    end
  end
end
