TeamPulsation::Application.routes.draw do
  root 'users#me'
  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout
  get 'me' => 'users#me', as: :me
  get 'me/edit' => 'users#edit_me', as: :edit_me
  put 'log/:indicator_id/:value' => 'log#value', as: :log
  resources :indicators
  resources :users
  resources :teams

  devise_for :users, path: "auth", path_names: { 
    sign_in: 'login', 
    sign_out: 'logout', 
    password: 'secret', 
    confirmation: 'verification', 
    unlock: 'unblock',
    registration: 'register', 
    sign_up: 'cmon_let_me_in' }

end
