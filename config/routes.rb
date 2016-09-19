Rails.application.routes.draw do

  get 'sessions/new'
  root 'books#index'
  get '/help', to:'static_pages#help'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/signup', to:'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/categories',   to: 'categories#index'
  post '/categories',   to: 'categories#create'
  resources :users
  resources :books do
    member do
      patch 'checkin'
      patch 'checkout'
    end
  end

end
