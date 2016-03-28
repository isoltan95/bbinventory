Rails.application.routes.draw do

  resources :items
  resources :categories
  resources :program_categories
  resources :programs
  resources :basket_items
  resources :baskets
  resources :carts

  
  get 'home' => 'home#home', as: :home
  get 'checkin' => 'items#checkin', as: :checkin
  get 'check_in' => 'items#check_in', as: :check_in
  get 'checkout' => 'items#checkout', as: :checkout
  get 'check_out' => 'items#check_out', as: :check_out
  get 'listall' => 'items#listall', as: :listall
  get 'get_new_barcode' => 'items#get_new_barcode', as: :get_new_barcode
  post 'get_new_barcode' => 'items#get_new_item_info', as: :get_new_item_info

  # Named routes - Cart
  get 'add_to_cart/:id' => 'carts#add_to_cart', as: :add_to_cart
  get 'show_cart' => 'carts#show_cart', as: :show_cart
  get 'remove_item/:id' => 'carts#remove_item', as: :remove_item
  get 'clear' =>  'carts#clear', as: :clear_cart
  
  # Set the root url
  root :to => 'home#home'



end
