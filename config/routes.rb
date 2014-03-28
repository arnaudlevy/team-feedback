TeamFeedback::Application.routes.draw do
  root 'users#me'
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  resources :indicators
  resources :users
  resources :groups
  resources :user_sessions

end
