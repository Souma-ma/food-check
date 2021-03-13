Rails.application.routes.draw do
  devise_for :users
  root to: 'foods#index'
  resources :foods  do
    resource :favorites, only: [:create, :destroy]
    collection  do
      get 'search'
    end
  end
  resources :users, only: :show
end
