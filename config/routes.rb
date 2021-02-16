Rails.application.routes.draw do
  root to: 'foods#index'
  resources :foods  do
    collection  do
      get 'search'
    end
  end
end
