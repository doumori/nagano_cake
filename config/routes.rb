Rails.application.routes.draw do
    root to: 'items#top'

    devise_for :admins, controllers: {
          sessions: 'admins/sessions'
        }
    namespace :admins do
        get '/' => '#top'
        resources :customers, only: [:show,:index,:edit, :update]
        resources :order_items, only: [:update]
        resources :orders, only: [:index, :show, :update]
        resources :genres, only: [:create, :index, :edit, :update]
        resources :items, only: [:create, :index, :destroy, :new, :show, :edit, :update]
    end

    devise_for :customers, controllers: {
          sessions: 'customers/sessions',
          registrations: 'customers/registrations',
          passwords: 'customers/passwords'
        }
    namespace :customers do
        get 'confirm' => '#confirm'
        patch 'hide' => '#hide'
        put 'hide' => '#hide'
    end

        resources :customers, only: [:show, :edit, :update]
        resources :items, only: [:index, :show]
        resources :ships, only: [:index, :edit, :destroy, :update, :create ]
        resources :orders, only: [:new, :create, :index, :show]
        resources :cart_items, only: [:index,:create,:destroy,:update]

        post 'orders/confirm' => 'customers/orders#confirm'
        get 'orders/thanks' => 'customers/orders#thanks'
        delete 'cart_items/destroy_all' => 'customers/cart_items#destroy_all'
end