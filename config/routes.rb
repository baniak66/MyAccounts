Rails.application.routes.draw do

  root 'contractors#index'

  resources :contractors


end
