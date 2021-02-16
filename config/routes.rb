Rails.application.routes.draw do
  root to: 'foods#index'
  resources :foods, only: [:index, :new, :create, :show, :edit, :update] do
    collection  do
      get 'search'
    end
  end
end
