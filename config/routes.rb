Rails.application.routes.draw do

  resources :services
  get '/' => 'sessions#welcome'

  get '/business_owner/signup' => 'business_owners#new'

  get '/business_owner/login'=> 'sessions#new'
  post '/business_owner/login' => 'sessions#create'

  get '/appointments/:id/edit' => 'appointments#edit', as: :edit_appointment
  delete '/business_owner/logout' => 'sessions#destroy'

  delete '/services/:id/delete' => 'services#destroy'
  delete '/appointments/:id/delete' => 'appointments#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  get '/services/:id/archive' => 'services#archive', as:'archive_service'

  # get '/clients/login' => 'sessions#new'
  # post '/clients/login' => 'sessions#create'

  resources :business_owners
  resources :appointments
  resources :dogwalkers

  resources :dogs do
    resources :appointments, only: [:new]
  end

  resources :clients do
    resources :appointments, only: [:index]
  end

end
