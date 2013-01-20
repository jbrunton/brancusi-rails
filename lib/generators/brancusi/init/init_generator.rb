module Brancusi
  class InitGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def inject_brancusi
      application_file = File.join("app/assets/javascripts", "application.js")
      # file_type        = :javascript
      pattern          = /\/\/=(?!.*\/\/=).*?$/m

      # raise Thor::Error, "Couldn't find either application.js or application.js.coffee files for use with Brancusi!" unless exists?(application_file)

      inject_into_file application_file, :before=>pattern do
        "//= require brancusi \n//= require app \n"
      end
    end
    
    def inject_javascripts
      layout_file = File.join("app/views/layouts/application.html.erb")
      pattern = /<%= javascript_include_tag "application" %>/
      
      inject_into_file layout_file, :before => pattern do
        ['<%= javascript_include_tag "//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js" %>',
          '<%= javascript_include_tag "//cdnjs.cloudflare.com/ajax/libs/davis.js/0.9.5/davis.min.js" %>',
          '<%= javascript_include_tag "//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.4.3/underscore-min.js" %>',
          '<%= javascript_include_tag "//cdnjs.cloudflare.com/ajax/libs/underscore.string/2.3.0/underscore.string.min.js" %>',
          '<%= javascript_include_tag "//cdnjs.cloudflare.com/ajax/libs/knockout/2.2.1/knockout-min.js" %>'].
          map { |s| "#{s}\n  " }.
          join
      end
    end

    def copy_app
      directory "app/assets/javascripts/app"
      copy_file "app/controllers/main_controller.rb"
      copy_file "app/views/main/index.html.erb"
      directory "app/views/templates"
    end
  
    def define_routes
      # TODO: do we need the root :to?
      route("root :to => 'main#index'")
      route("match '/*id' => 'main#index', id: /(?!api|assets).*/")
    end
    
  end
end
