Rails.application.routes.draw do

  resources :items
  resources :categories
  resources :program_categories
  resources :programs
  resources :basket_items
  resources :baskets
  resources :carts
  
  root 'items#index'
  
  get 'home' => 'items#index', as: :home
  get 'checkin' => 'items#checkin', as: :checkin
  get 'check_in' => 'items#check_in', as: :check_in
  get 'checkout' => 'items#checkout', as: :checkout
  get 'check_out' => 'items#check_out', as: :check_out

  # Named routes - Cart
  get 'add_to_cart/:id' => 'carts#add_to_cart', as: :add_to_cart
  get 'show_cart' => 'carts#show_cart', as: :show_cart
  get 'remove_item/:id' => 'carts#remove_item', as: :remove_item
  get 'clear' =>  'carts#clear', as: :clear_cart


end
