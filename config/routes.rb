Rails.application.routes.draw do
  resources :sports

  resources :venues

  root to: 'visitors#index'
  devise_for :users
end
