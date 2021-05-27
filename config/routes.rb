Rails.application.routes.draw do
  resources :appointments
  resources :dogs
  resources :dogwalkers
  resources :clients
  resources :business_owners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
