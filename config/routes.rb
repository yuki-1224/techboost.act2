Rails.application.routes.draw do


  root 'pages#index'
  get 'pages/help'

  get 'sessions/new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :topics

  get 'favorites/index'
  post '/favorites' => 'favorites#create'
  delete '/favorites' => 'favorites#destroy'

  get '/comments' => 'comments#new'
  post '/comments' => 'comments#create'
  delete '/comments' => 'comments#destroy'
end
