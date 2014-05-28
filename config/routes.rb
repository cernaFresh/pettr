Pettr::Application.routes.draw do

  get "shelters/index"
  get "shelters/view"
  get "home/index"
  get "pets/barnyard"
  get "pets/bird"
  get "pets/cat"
  get "pets/dog"
  get "pets/horse"
  get "pets/pig"
  get "pets/reptile"
  get "pets/smallfurry"
  get "pets/view"

  root :to => 'home#index'

  get '/pets/:id', to: 'pets#view'
  get '/shelters/:id', to: 'shelters#view'
  get '/shelters', to: 'shelters#index'
end
