Biteprofile::Application.routes.draw do
  root 'home#index'

  match 'auth/:provider/callback', to: "authentications#create", via: [:get, :post]

  match 'panel', to: 'panel#show', via: [:get]

  resources :user, only: [:show, :update] do
    resource :diet_exclusions, only: [:create, :update]
  end
end
