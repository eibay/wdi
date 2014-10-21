Rails.application.routes.draw do

  root 'artists#index'

  resources :artists, :songs

end




# GET /artists artists#index  
# POST  /artists artists#create
# GET /artists/:id artists#show
# GET /artists/:id/edit  artists#edit
# PATCH/PUT /artists/:id artists#update
# DELETE  /artists/:id artists#destroy

# GET /songs songs#index  
# GET /songs/:id songs#show
# GET /songs/:id/edit  songs#edit
# PATCH/PUT /songs/:id songs#update
# DELETE  /songs/:id songs#destroy