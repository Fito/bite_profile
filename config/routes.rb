Biteprofile::Application.routes.draw do
  root 'home#index'

  match 'auth/:provider/callback', to: "authentications#create", via: [:get, :post]
end
