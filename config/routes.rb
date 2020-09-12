Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/help'

  get 'sessions/new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
end
