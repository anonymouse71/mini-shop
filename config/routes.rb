Rails.application.routes.draw do
  resources :billing_details
  resources :orders
  resources :line_items
  resources :carts
  resources :products
  resources :shipments
  resources :payments

  ActiveAdmin.routes(self)
  devise_for ActiveAdmin::Devise.config

  devise_for :users, path_names: { sign_up: 'register' },
             controllers: {  omniauth_callbacks:  'users/omniauth_callbacks',
                             sessions:            'sessions',
                             registrations:       'registrations',
                             passwords:           'passwords'
             }

  # devise_scope :user do
  #   match '/users/auth/stripe_connect/callback' => 'users/omniauth_callbacks#stripe_connect'
  #   match '/users/auth/stripe_connect/failure' => 'users/omniauth_callbacks#stripe_connect_failure'
  #   post 'return_after_signin' => 'sessions#return_after_signin'
  # end

  #resources :users

  get 'pages/index'
  get 'home' => 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'category' => 'products#category'

  get 'dashboard' => 'users#dashboard'
  get 'user_info' => 'users#info'
  post 'account_settings' => 'users#account_settings'
  get 'order_list' => 'users#order_list'
  get 'order_details/:id' => 'users#order_details', as: :order_details
  get 'manage_address' => 'users#manage_address'

  get 'cart' => 'carts#cart'
  get 'cart_items' => 'carts#cart_items'
  get 'checkout' => 'orders#checkout', :as => :checkout
  get 'shipping_info' => 'orders#shipping_info', as: :shipping_info
  get 'billing_info' => 'orders#billing_info', :as => :billing_info
  get 'shipping_method' => 'orders#shipping_method', :as => :shipping_method
  get 'payment_info' => 'orders#payment_info', :as => :payment_info
  get 'review_order' => 'orders#review_order', :as => :review_order
  get 'confirm_order' => 'orders#confirm_order'
  get 'remove_item_from_cart/:id' => 'line_items#remove_item_from_cart'
  post 'save_shipping_address' => 'orders#save_shipping_address', as: :save_shipping_address, via: [:post]
  get 'filter_products' => 'products#filter_products'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
