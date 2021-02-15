Rails.application.routes.draw do
  root to: 'foods#index'
  resources :foods, only: [:index, :new, :create] do
    collection  do
      get 'search'
    end
  end
end
