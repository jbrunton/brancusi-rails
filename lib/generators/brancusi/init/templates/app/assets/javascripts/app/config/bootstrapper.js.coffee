class window.Bootstrapper extends Brancusi.Bootstrapper
  configure_container: (app) ->
    container = super(app)
    container.register_class 'Router', Brancusi.Davis.Router, singleton: true
    container.register_class 'Renderer', Brancusi.Knockout.Renderer, singleton: true
    container
    