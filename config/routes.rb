Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root 'posts#index'

  get 'contact', to: 'pages#contact_show'
  post 'contact', to: 'pages#contact_create', as: "contact_submit"
  
  constraints ->(request) { request.env['warden'].user&.admin? } do
    mount Avo::Engine, at: Avo.configuration.root_path
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
