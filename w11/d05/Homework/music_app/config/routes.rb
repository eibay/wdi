Rails.application.routes.draw do
  get "artists" => "artists#index"
  post 'artists' => 'artists#create'
  get 'artists/:id' => 'artists#show'
  put 'artists/:id' => 'artists#update'
  delete 'artists/:id' => 'artists#destroy'
end
