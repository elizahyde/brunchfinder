Brunchfinder::Application.routes.draw do

  get '/search' => 'brunch_finders#search'

  get '/results' => 'brunch_finders#results'

  root :to => 'brunch_finders#index'
end
