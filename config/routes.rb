Rails.application.routes.draw do
  
  resources :tests
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :trainings do
    post 'likes', to: 'trainings#likes'
  end
  resources :users
 
  get 'home/index'
  get '/auth/:provider/callback' => 'sessions#omniauth'
  root 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
