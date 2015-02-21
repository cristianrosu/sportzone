Rails.application.routes.draw do
  get 'explore', to: 'explore#index'

  get 'explore/map'

  resources :sports

  resources :venues

  root to: 'visitors#index'
  devise_for :users
end
