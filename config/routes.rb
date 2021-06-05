Rails.application.routes.draw do

  get '/' => 'sessions#welcome'

  get '/business_owner/signup' => 'business_owners#new'

  get '/business_owner/login'=> 'sessions#new'
  post '/business_owner/login' => 'sessions#create'

  # get '/clients/login' => 'sessions#new'
  # post '/clients/login' => 'sessions#create'

  resources :appointments
  resources :dogs
  resources :dogwalkers
  resources :clients
  resources :business_owners

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
