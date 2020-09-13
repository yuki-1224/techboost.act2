Rails.application.routes.draw do
  get 'topics/new'
  root 'pages#index'
  get 'pages/help'

  get 'sessions/new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :topics
end
