Rails.application.routes.draw do

  root 'superheros#index'

  resources :superheros

end


#         Prefix Verb   URI Pattern                    Controller#Action
#           root GET    /                              superheros#index
#     superheros GET    /superheros(.:format)          superheros#index
#                POST   /superheros(.:format)          superheros#create
#  new_superhero GET    /superheros/new(.:format)      superheros#new
# edit_superhero GET    /superheros/:id/edit(.:format) superheros#edit
#      superhero GET    /superheros/:id(.:format)      superheros#show
#                PATCH  /superheros/:id(.:format)      superheros#update
#                PUT    /superheros/:id(.:format)      superheros#update
#                DELETE /superheros/:id(.:format)      superheros#destroy