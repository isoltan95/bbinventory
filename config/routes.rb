Rails.application.routes.draw do
  resources :items
  root 'items#index'

  get 'checkout' => 'items#checkout', as: :checkout
  get 'check_out' => 'items#check_out', as: :check_out
end
