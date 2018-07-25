Rails.application.routes.draw do

  get 'sessions/new'
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/admin', to: 'static_pages#admin'
  # get words', to: 'static_pages#words'

  resources :users do
    member do
      get :following, :followers
    end
  end

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :categories do 
      resources :words
    end
  end

  resources :words, only: [:index]
  resources :relationships, only: [:create, :destroy]
  resources :categories,  only: [:index, :show]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :lessons, only: [:create, :show, :update] do 
    resources :lesson_words, only: [:show, :update], path: 'words'
  end 
  resources :activities, only: [:index, :create]
end