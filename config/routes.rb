Rails.application.routes.draw do

  root 'evidences#index'

  resources :contractors
  resources :evidences
  resources :accounts


end
