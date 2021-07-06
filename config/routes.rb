Rails.application.routes.draw do
  get 'recipes/index'
  root to: "recipes#index"
  resources :recipes, only: :index
end
