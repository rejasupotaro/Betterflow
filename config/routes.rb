Betterflow::Application.routes.draw do
  get "api/get_track_list"

  get "info/index"
  root :to => 'info#index'
end
