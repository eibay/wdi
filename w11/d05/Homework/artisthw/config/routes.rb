Rails.application.routes.draw do
  get 'artists' => 'artists#index'
  post 'artists' => 'artists#create'
  get 'artists/:id' => 'artists#show'
  put 'artists/:id' => 'artists#update'
  delete 'artists/:id' => 'artists#destroy'

  get 'songs' => 'songs#index'
  post 'songs' => 'songs#create'
  get 'songs/:id' => 'songs#show'
  put 'songs/:id' => 'songs#update'
  delete 'songs/:id' => 'songs#destroy'




end
