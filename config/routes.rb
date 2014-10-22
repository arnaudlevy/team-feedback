TeamPulsation::Application.routes.draw do
  root 'users#me'
  get 'me' => 'users#me', as: :me
  get 'me/edit' => 'users#edit_me', as: :edit_me
  put 'log/:indicator_id/:value' => 'log#value', as: :log
  resources :workshops
  resources :indicators
  devise_for :users
  resources :users
  resources :teams
end
