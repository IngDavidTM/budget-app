Rails.application.routes.draw do
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  root to: 'home#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :home, only: [:index]
  resources :categories, only: [:index, :new, :create] do
    resources :entities, only: [:index, :new, :create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
