Rails.application.routes.draw do
  namespace :auth do
    resources :users do
      resources :articles do
        collection do
          get :feed
          get :follows
          get :follow_tags
          get :stocks
          post :markdown_preview
        end
        resources :stocks, only: [:create, :destroy]
      end
      resources :follows, only: [:create, :destroy]
      resources :follow_tags, only: [:create, :destroy]

      member do
        get :follow_users
        get :followers
        get :comments
        get :alerts
      end

    end
  end

  resources :articles, only: [:index, :show]
  resources :tags, only: [:show]


  devise_for :users
  root to: 'articles#index'
end
