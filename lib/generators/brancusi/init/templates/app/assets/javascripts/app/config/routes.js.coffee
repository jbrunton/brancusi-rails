Application.routes.draw ->
  # match a URL
  # @match '/', 'home#index'
  
  # match with params
  # @match '/users/:id', 'users#view'

# Execute the router on the first page load.  Comment this out if you instead generate content on
# the server during the first request.  
Application.config.route_on_load = true
