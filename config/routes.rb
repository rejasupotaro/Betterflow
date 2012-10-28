Betterflow::Application.routes.draw do
  get "info/index"
  root :to => 'info#index'
end
