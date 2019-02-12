Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'pages#home'

  # AUTHENTICATION

  devise_for :users

  # ADMIN

  get "/admin", to: "pages#admin"

  #BLOG

  get "/blog/:display_url", to: "posts#show", as: :post
  patch "/blog/:id", to: "posts#update"
  resources :posts, except: [:index, :show]
  get "/blog", to: "posts#index"

  # LEADS

  resources :leads, only: [:index, :new, :create]
  get 'download_pdf', to: "leads#download_pdf", as: "download_pdf"

end
