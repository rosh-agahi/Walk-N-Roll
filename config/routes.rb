Rails.application.routes.draw do

  get '/' => 'sessions#welcome'

  get '/business_owner/signup' => 'business_owners#new'

  get '/business_owner/login'=> 'sessions#new'
  post '/business_owner/login' => 'sessions#create'

  delete '/business_owner/logout' => 'sessions#destroy'

  # get '/clients/login' => 'sessions#new'
  # post '/clients/login' => 'sessions#create'

  resources :business_owners
  resources :appointments
  resources :dogs
  resources :dogwalkers
  resources :clients

end
