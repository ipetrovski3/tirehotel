Rails.application.routes.draw do
  resources :warehouses do
    resources :clients
    get 'clients/:id/transfer', to: 'clients#transfer', as: :transfer_client
  end
  get '/search', to: 'clients#search'
  get '/login', to: 'pages#login'
  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
