Rails.application.routes.draw do
  root to: 'foods#index'
  resources :foods, only: [:index, :new, :create, :show] do
    collection  do
      get 'search'
    end
  end
end
