Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'pages#home'

  # AUTHENTICATION

  devise_for :users

  # ADMIN

  get "/admin", to: "pages#admin"

  #BLOG

  get "/posts/:display_url", to: "posts#show", as: :post
  resources :posts, except: [:index, :show]
  get "/blog", to: "posts#index"

end
