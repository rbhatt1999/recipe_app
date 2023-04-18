Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :recipes do 
    resources :recipe_foods, only: [:new,:create,:destroy, :edit, :update]
  end
  resources :foods, only: [:destroy,:index,:show,:new,:create]
  root "foods#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
