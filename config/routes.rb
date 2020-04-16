Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :customers do
    get 'customers/index'
    get 'customers/show'
    get 'customers/top'
  end
  namespace :admins do
    get 'order_items/update'
  end
  namespace :admins do
    get 'orders/index'
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admins do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admins do
    get 'genres/index'
    get 'genres/update'
    get 'genres/create'
    get 'genres/edit'
  end
  namespace :admins do
    get 'items/index'
    get 'items/update'
    get 'items/create'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :customers do
    get 'cart_items/index'
    get 'cart_items/create'
    get 'cart_items/destroy'
    get 'cart_items/update'
    get 'cart_items/destroy_all'
  end
  namespace :customers do
    get 'orders/new'
    get 'orders/create'
    get 'orders/show'
    get 'orders/confirm'
    get 'orders/thanks'
    get 'orders/index'
  end
  namespace :customers do
    get 'ships/index'
    get 'ships/edit'
    get 'ships/destroy'
    get 'ships/update'
    get 'ships/create'
  end
  namespace :customers do
    get 'items/index'
    get 'items/show'
    get 'items/top'
  end

end
