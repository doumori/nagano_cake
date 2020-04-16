Rails.application.routes.draw do
    namespace :admins do
        devise_for :admins
        devise_scope :admin do
            post '/admins/sign_in' => 'admins/sessions#create'
        end
        resources :customers, only: [:show,:index,:edit, :update]
        resources :order_items, only: [:update]
        resources :orders, only: [:index, :show, :update]
        resources :genres, only: [:create, :index, :edit, :update]
        resources :items, only: [:create, :index, :destroy, :new, :show, :edit, :update]
    end
    namespace :customers do
        devise_for :customers
        devise_scope :customer do
            post '/customer/sign_in' => 'customer/sessions#create'
        end
        resources :customers, only: [:show, :edit, :update]
        resources :items, only: [:index, :show]
        resources :ships, only: [:index, :edit, :destroy, :update, :create ]
        resources :orders, only: [:new, :create, :index, :show]
        resources :cart_items, only: [:index,:create,:destroy,:update]
    end
end