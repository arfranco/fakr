Rails.application.routes.draw do
  devise_for :users
  get ':fakr', to: 'links#show', as: 'fakr'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'links#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'

  get 'links', to: 'link#show'
  get 'links/new', to: 'link#new'
  post 'links', to: 'link#create'
  get 'link/:id', to: 'link#page', as: 'link_id'
  
  get 'links/:id/comments', to: 'link/comments#show'
  get 'link/:id/comment/new', to: 'link/comments#new'
  post 'comments', to: 'comments#create'
  get 'link/:id/comments/edit', to: 'comments#edit', as: 'comments_edit'
  get 'link/:id/comment', to: 'link/comments#page', as: 'comment'
  


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
