Rails.application.routes.draw do
  
  root 'superheros#index'
  resources :superheros

end
