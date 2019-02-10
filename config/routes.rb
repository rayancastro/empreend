Rails.application.routes.draw do
  root to: 'pages#home'

  # AUTHENTICATION

  devise_for :users

  # ADMIN

  get "/admin", to: "pages#admin"

  #BLOG

  get "/post/:display_name", to: "posts#show", as: :post
  get "/blog", to: "posts#index"
  resources :posts, except: [:index, :show]

end
