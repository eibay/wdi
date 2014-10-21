Rails.application.routes.draw do
  resources :movies do
    resources :roles
  end
  resources :actors

  root 'movies#index'

#   Prefix Verb   URI Pattern                                Controller#Action
#     movie_roles GET    /movies/:movie_id/roles(.:format)          roles#index
#                 POST   /movies/:movie_id/roles(.:format)          roles#create
#  new_movie_role GET    /movies/:movie_id/roles/new(.:format)      roles#new
# edit_movie_role GET    /movies/:movie_id/roles/:id/edit(.:format) roles#edit
#      movie_role GET    /movies/:movie_id/roles/:id(.:format)      roles#show
#                 PATCH  /movies/:movie_id/roles/:id(.:format)      roles#update
#                 PUT    /movies/:movie_id/roles/:id(.:format)      roles#update
#                 DELETE /movies/:movie_id/roles/:id(.:format)      roles#destroy
#          movies GET    /movies(.:format)                          movies#index
#                 POST   /movies(.:format)                          movies#create
#       new_movie GET    /movies/new(.:format)                      movies#new
#      edit_movie GET    /movies/:id/edit(.:format)                 movies#edit
#           movie GET    /movies/:id(.:format)                      movies#show
#                 PATCH  /movies/:id(.:format)                      movies#update
#                 PUT    /movies/:id(.:format)                      movies#update
#                 DELETE /movies/:id(.:format)                      movies#destroy
#          actors GET    /actors(.:format)                          actors#index
#                 POST   /actors(.:format)                          actors#create
#       new_actor GET    /actors/new(.:format)                      actors#new
#      edit_actor GET    /actors/:id/edit(.:format)                 actors#edit
#           actor GET    /actors/:id(.:format)                      actors#show
#                 PATCH  /actors/:id(.:format)                      actors#update
#                 PUT    /actors/:id(.:format)                      actors#update
#                 DELETE /actors/:id(.:format)                      actors#destroy
#            root GET    /                                          movies#index
  
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
