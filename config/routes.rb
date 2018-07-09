Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/help', to: 'static_pages#help'
  get '/lesson', to: 'static_pages#lesson'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]

end
