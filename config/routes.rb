Rails.application.routes.draw do
  
  root 'home#index'

  resources :items
  resources :orders
  resources :carts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
