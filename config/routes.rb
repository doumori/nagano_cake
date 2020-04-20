Rails.application.routes.draw do
    root to: 'items#top'
        post 'orders/confirm' => 'orders#confirm'
        get 'orders/thanks' => 'orders#thanks'
        delete 'cart_items/destroy_all' => 'cart_items#destroy_all'

    devise_for :admins, controllers: {
          sessions: 'admins/sessions'
        }
    namespace :admins do
        get '/' => 'admins#top'
        resources :customers, only: [:show,:index,:edit, :update]
        resources :order_items, only: [:update]
        resources :orders, only: [:index, :show, :update]
        resources :genres, only: [:create, :index, :edit, :update, :destroy]
        resources :items, only: [:create, :index, :destroy, :new, :show, :edit, :update]
    end

    devise_for :customers, controllers: {
          sessions: 'customers/sessions',
          registrations: 'customers/registrations',
          passwords: 'customers/passwords'
        }
    namespace :customers do
        get 'confirm' => 'customers#confirm'
        patch 'hide' => 'customers#hide'
        put 'hide' => 'customers#hide'
    end

    scope module: :customers do
        resources :customers, only: [:show, :edit, :update]
    end

        resources :items, only: [:index, :show]
        resources :ships, only: [:index, :edit, :destroy, :update, :create ]
        resources :orders, only: [:new, :create, :index, :show]
        resources :cart_items, only: [:index,:create,:destroy,:update]
end