Rails.application.routes.draw do

  root 'movies#index'

  resources :movies
  resources :actors
  resources :roles
  
#    Prefix Verb   URI Pattern                Controller#Action
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
end
