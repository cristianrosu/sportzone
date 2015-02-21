Rails.application.routes.draw do
  resources :venues

  root to: 'visitors#index'
  devise_for :users
end
