Rails.application.routes.draw do
  resources :items
  root 'items#index'
  
  get 'home' => 'items#index', as: :home
  get 'checkin' => 'items#checkin', as: :checkin
  get 'check_in' => 'items#check_in', as: :check_in
  get 'checkout' => 'items#checkout', as: :checkout
  get 'check_out' => 'items#check_out', as: :check_out
end
