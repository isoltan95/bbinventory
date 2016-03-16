Rails.application.routes.draw do

  resources :items
  resources :categories
  resources :program_categories
  resources :programs
  
  root 'items#index'
  
  get 'home' => 'items#index', as: :home
  get 'checkout' => 'items#checkout', as: :checkout
  get 'check_out' => 'items#check_out', as: :check_out
end
