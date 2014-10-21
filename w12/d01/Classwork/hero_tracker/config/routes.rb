Rails.application.routes.draw do
  root 'superheros#index'
  #root with a superhero controller
  resources :superheros
#does not include index
end
