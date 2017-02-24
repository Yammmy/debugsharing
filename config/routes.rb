Rails.application.routes.draw do
  mount RuCaptcha::Engine => "/rucaptcha"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  root 'welcome#index'
  get '/about' => 'welcome#about'

  namespace :admin do
    resources :products
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
    end
    collection do
      match 'search' => 'products#search', via: [:get, :post], as: :search
      get :rails
      get :laravel
      get :ruby
      get :python
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
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
