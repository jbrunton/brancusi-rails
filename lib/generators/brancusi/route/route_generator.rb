module Brancusi
  class RouteGenerator < Rails::Generators::Base
    argument :routing_code, :type => :string
    
    def create_route
      sentinel = /\.routes\.draw\s*->\s*$/
      inject_into_file 'app/assets/javascripts/app/config/routes.js.coffee', "\n  #{routing_code}\n", { :after => sentinel, :verbose => false }
    end
  end
end
