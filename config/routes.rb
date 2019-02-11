Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'pages#home'

  # AUTHENTICATION

  devise_for :users

  # ADMIN

  get "/admin", to: "pages#admin"

  #BLOG

  get "/post/:display_url", to: "posts#show", as: :post
  get "/blog", to: "posts#index"
  resources :posts, except: [:index, :show]

end
