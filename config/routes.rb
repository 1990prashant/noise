Rails.application.routes.draw do
  devise_for :users

  get '/users/:id/profile', to: 'users#profile', as: :user_profile
  post '/share', to: 'users#share'

  root 'users#profile'
  resources :groups
end
