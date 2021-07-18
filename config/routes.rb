Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  resources :recipes do
    collection do
      get 'search'
      get 'incremental_search'
    end
    member do
      get 'page_next'
      get 'page_prev'
    end
    resources :user_likes, only: [:create, :destroy]
  end
  resources :users, only: :show do
    member do
      post 'select_publish'
      post 'favorites'
      post 'my_recipes'
    end
  end
end
