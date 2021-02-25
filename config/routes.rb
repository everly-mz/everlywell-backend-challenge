Rails.application.routes.draw do
  resources :headlines
  resources :members 

  get '/short/:short_url', to: 'short#show'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
