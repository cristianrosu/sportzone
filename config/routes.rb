require 'api_version'

Rails.application.routes.draw do
  get 'explore', to: 'explore#index'

  get 'explore/map'

  resources :sports

  resources :venues

  root to: 'visitors#index'
  devise_for :users

  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: APIVersion.new('v1', true) do
      resources :venues, only: [:index, :show]
      resources :sports, only: [:index, :show]
    end
  end
end
