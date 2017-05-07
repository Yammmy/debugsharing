Rails.application.routes.draw do

  devise_for :users, controllers: {
    :omniauth_callbacks => "callbacks"
  }

  root 'welcome#index'
  get '/about' => 'welcome#about'
  get '/google13b157faa1635496' => 'check#google13b157faa1635496'


  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end
  resources :users, only: [:index]
  resources :messages, only: [:new, :create]

  namespace :admin do
    root 'products#index'
    resources :products do
      member do
        post :publish
        post :hide
      end
      collection do
        post :bulk_update
      end
    end
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
      post :collect
      post :discollect
      put 'like', to:'products#upvote'
    end
    collection do
      get :search
      get :autocomplete
      get :rails
      get :heroku
      get :frontend
      get :backend
      get :others
    end
    resources :comments
  end

  resources :carts do
    collection do
      delete :clear_cart
      post   :checkout
    end
  end

  resources :cart_items
  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancell
    end
  end

  namespace :account do
    resources :orders
    resources :collections
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
