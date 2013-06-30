Brunchfinder::Application.routes.draw do

  get '/search' => 'brunch_finders#search'

  get '/results' => 'brunch_finders#results'

  get '/about' => 'brunch_finders#about'

  root :to => 'brunch_finders#index'

  match '*a', :to => 'errors#routing'
end
