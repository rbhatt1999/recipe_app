Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :recipe_foods
  resources :recipes
  resources :foods, only: [:destroy,:index, :new,:create]
  root "foods#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
