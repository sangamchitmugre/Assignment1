Rails.application.routes.draw do
 
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

 get 'sessions/new'

	get 'users/help'
	get 'users/login'
	get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    get '/products',  to:'products#new'
    post   '/products',   to: 'products#create'
    get 'products/list', to: 'products#index'


	resources :users
  resource :cart
  resources :order_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
