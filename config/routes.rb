ActionController::Routing::Routes.draw do |map|
  map.resources :bugs, :collection=>{:search=>:get, :sort=>:get}
  map.resources :tasks
  map.resources :units
  map.resources :demands
  map.resources :analyses
  map.resources :designs
  map.resources :users
  map.resources :projects
  map.resources :knowledges

  map.resources :docs

  map.index '/', :controller=>'account', :action=> 'login'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
