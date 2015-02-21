require 'api_version'

Rails.application.routes.draw do
  root to: redirect('explore/map')
  get 'explore', to: 'explore#index'
  get 'explore/map'

  devise_for :users
  resources :sports
  resources :venues

  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: APIVersion.new('v1', true) do
      resources :venues, only: [:index, :show]
      resources :sports, only: [:index, :show]
    end
  end
end
