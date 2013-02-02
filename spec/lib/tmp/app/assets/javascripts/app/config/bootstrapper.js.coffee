class window.Bootstrapper extends Brancusi.Bootstrapper
  configure_container: (app) ->
    container = super(app)
    container.register_class 'Router', Brancusi.Routes.DavisRouter, singleton: true
    container.register_class 'Renderer', Brancusi.Renderer.KnockoutRenderer, singleton: true
    container
    