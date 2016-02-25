Rails.application.routes.draw do

  root 'evidences#index'

  resources :contractors
  post  '/contractors/create_evidence', to: 'contractors#create_evidence', as: 'create_evidence'

  resources :evidences do
    resources :decrees
  end

  resources :accounts


end
