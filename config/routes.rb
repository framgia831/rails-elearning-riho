Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/help', to: 'static_pages#help'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/admin', to: 'static_pages#admin'


  resources :users do
    member do
      get :following, :followers
    end
  end

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :categories
  end
  resources :relationships,       only: [:create, :destroy]
  resources :categories,  only: [:index, :show]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
