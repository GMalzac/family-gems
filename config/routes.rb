Rails.application.routes.draw do
  devise_for :users
  root to: 'conversations#index'
  resources :groups do
    resources :members
    resources :conversations do
      resources :messages
    end
  end
end
