Rails.application.routes.draw do

  devise_for :users

  root to: "recipes#index"

  resources :recipes do
    # 検索機能と検索結果予測
    collection do
      get 'search'
      get 'incremental_search'
    end
    # レシピの一覧のページング機能
    member do
      get 'page_next'
      get 'page_prev'
    end
    # お気に入り機能
    resources :user_likes, only: [:create, :destroy]
    # レシピ難易度評価機能
    resources :reviews, only: [:create, :destroy]
    # 調理画像の削除
    resources :cooking_images, only: :destroy
  end

  resources :users, only: :show do
    member do
      # マイページで自分のレシピの表示設定
      post 'select_publish'
      # マイページでお気に入りのレシピを表示する
      post 'favorites'
      # マイページで自分のレシピを表示する
      post 'my_recipes'
    end
  end

  resources :groups do
    member do
      # グループから退出
      delete 'exit'
      resources :group_invitations, only: [:create, :destroy]
    end
    resources :group_likes, only: [:new, :create, :destroy]
    resources :group_shoppings, only: [:show, :new, :create, :destroy]
  end

end
