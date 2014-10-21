Rails.application.routes.draw do
  root 'movies#index'
 
  resources :movies do
  resources :actors, :roles
end



end
