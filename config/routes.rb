Rails.application.routes.draw do
  
  # devise_for :users
  root 'items#index'

  namespace :admin do 
    resources :orders
    resources :news
    resources :items
    resources :comments
    resources :categories
  end

  resources :carts
  get '/cart', to: 'carts#show'
  get '/cart/clear', to: 'carts#clear'
  post '/cart/add/:id', to: 'carts#add_to_cart'
  delete '/cart/remove/:id', to: 'carts#remove_from_cart'

  resources :orders
  resources :items do
    resources :comments
  end  

  get "/pages/:page" => "pages#show"
	
end
