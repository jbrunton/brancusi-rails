module Brancusi
  class InitGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def copy_app
      directory "app/assets/javascripts/app", "app/assets/javascripts/app"
      copy_file "app/controllers/main_controller.rb"
      copy_file "app/views/main/index.html.erb"
    end
  
    def define_routes
      # TODO: do we need the root :to?
      route("root :to => 'main#index'")
      route("match '/*id' => 'main#index', id: /(?!api|assets).*/")
    end
  end
end
