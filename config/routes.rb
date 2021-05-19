Rails.application.routes.draw do
  devise_for :users
  root to: 'conversations#index'
  get 'conversations', to: 'conversations#index'
end
