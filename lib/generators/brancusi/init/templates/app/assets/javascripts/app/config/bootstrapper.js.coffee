class Application.Bootstrapper extends brancusi.Bootstrapper
  configure_container: (app) ->
    container = super(app)
    container.register_class 'Router', brancusi.routes.DavisRouter, singleton: true
    container.register_class 'Renderer', brancusi.renderer.KnockoutRenderer, singleton: true
    container
    