Rails.application.routes.draw do
  devise_for :users
  root to: 'conversations#index'
  resources :groups do
    resources :conversations
  end
end
