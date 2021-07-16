Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  resources :recipes do
    collection do
      get 'search'
      get 'incremental_search'
    end
    resources :user_likes, only: [:create, :destroy]
  end
  resources :users, only: :show
end
