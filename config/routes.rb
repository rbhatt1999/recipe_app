Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:new,:create,:edit,:update,:destroy]
  resources :recipes do 
    resources :recipe_foods, only: [:new,:create,:destroy, :edit, :update]
  end
  resources :foods, only: [:destroy,:index,:new,:create]
  get 'public_recipes', to: 'public_recipes#index'

  root "foods#index"
  get 'shopping_list', to: 'shopping_list#index'
end
