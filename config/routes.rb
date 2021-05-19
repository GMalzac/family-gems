Rails.application.routes.draw do
  root to: 'conversations#index'
  get 'conversations', to: 'conversations#index'
end
