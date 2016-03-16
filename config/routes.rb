Rails.application.routes.draw do
  get 'programs/create'

  get 'programs/new'

  get 'programs/update'

  get 'programs/edit'

  get 'program_categories/create'

  get 'program_categories/new'

  get 'program_categories/update'

  get 'program_categories/edit'

  get 'program_categories/destroy'

  get 'categories/create'

  get 'categories/new'

  get 'categories/update'

  get 'categories/edit'

  resources :items
  root 'items#index'
  
  get 'home' => 'items#index', as: :home
  get 'checkout' => 'items#checkout', as: :checkout
  get 'check_out' => 'items#check_out', as: :check_out
end
