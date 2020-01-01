Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

  resources :comics
  resources :users, except: [:new]
  resources :publishers, except: [:destroy]

  resources :comics do
    resources :comments
  end


end
