Rails.application.routes.draw do

  root 'movies#index'

  resources :movies
  resources :actors
  resources :roles

#      Prefix Verb   URI Pattern                Controller#Action
#       root GET    /                          movies#index
#     movies GET    /movies(.:format)          movies#index
#            POST   /movies(.:format)          movies#create
#  new_movie GET    /movies/new(.:format)      movies#new
# edit_movie GET    /movies/:id/edit(.:format) movies#edit
#      movie GET    /movies/:id(.:format)      movies#show
#            PATCH  /movies/:id(.:format)      movies#update
#            PUT    /movies/:id(.:format)      movies#update
#            DELETE /movies/:id(.:format)      movies#destroy

#     actors GET    /actors(.:format)          actors#index
#            POST   /actors(.:format)          actors#create
#  new_actor GET    /actors/new(.:format)      actors#new
# edit_actor GET    /actors/:id/edit(.:format) actors#edit
#      actor GET    /actors/:id(.:format)      actors#show
#            PATCH  /actors/:id(.:format)      actors#update
#            PUT    /actors/:id(.:format)      actors#update
#            DELETE /actors/:id(.:format)      actors#destroy

#      roles GET    /roles(.:format)           roles#index
#            POST   /roles(.:format)           roles#create
#   new_role GET    /roles/new(.:format)       roles#new
#  edit_role GET    /roles/:id/edit(.:format)  roles#edit
#       role GET    /roles/:id(.:format)       roles#show
#            PATCH  /roles/:id(.:format)       roles#update
#            PUT    /roles/:id(.:format)       roles#update
#            DELETE /roles/:id(.:format)       roles#destroy


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
