Rails.application.routes.draw do

  root 'evidences#index'

  resources :contractors
  post  '/contractors/create_evidence', to: 'contractors#create_evidence', as: 'create_evidence'

  resources :evidences do
    resources :decrees
  end
  patch  '/evidences/:id/accept', to: 'evidences#accept', as: 'accept'

  resources :accounts


end
