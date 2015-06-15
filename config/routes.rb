Rails.application.routes.draw do
  get ':fakr', to: 'links#show', as: 'fakr'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'links#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  
  get 'users/new', to: 'users#new'
  post 'users', to: 'users#create'

  get 'users/login', to: 'sessions#show'
  post 'users/session', to: 'sessions#create'
  delete 'users/session', to: 'sessions#destroy'

  get 'links/new', to: 'links#new'
  post 'links/new', to: 'links#create'
  get 'link/:id', to: 'links#page'
  get 'links', to: 'links#show'

  get 'link/:id/comments', to: 'comments#show'
  post 'link/:id/comments/new', to: 'comments#create'
  get 'link/:id/comments/new', to: 'comments#new'

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
