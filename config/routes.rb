TeamFeedback::Application.routes.draw do
  root 'users#me'
  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout
  get 'me' => 'users#me', as: :me
  get 'me/edit' => 'users#edit_me', as: :edit_me
  resources :indicators
  resources :users
  resources :teams
  resources :user_sessions

end
