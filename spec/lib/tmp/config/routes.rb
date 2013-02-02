ExampleApp::Application.routes.draw do
  match '/*id' => 'main#index', id: /(?!api|assets).*/

  root :to => 'main#index'

end