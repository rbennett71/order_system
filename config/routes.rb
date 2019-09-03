Rails.application.routes.draw do
  resources :orders do
    resources :order_items
  end
  root to: 'products#home'
  resources :products
  resources :vendors
end
