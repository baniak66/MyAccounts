Rails.application.routes.draw do

  root 'evidences#index'

  resources :contractors
  resources :evidences do
    resources :decrees
  end
  resources :accounts


end
