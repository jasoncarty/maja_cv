Rails.application.routes.draw do

  # Custom 404/400/500 pages
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  match "/400" => "errors#error400", via: [ :get, :post, :patch, :delete ]
  match "/500" => "errors#error500", via: [ :get, :post, :patch, :delete ]

  mount Ckeditor::Engine => '/ckeditor'
  scope module: 'public' do
    
    resources :pages
    resources :users
    resources :sessions

    delete "log_out", to: "sessions#destroy", as: "destroy_user_session"
    get "log_in", to: "sessions#new", as: "new_user_session"

    root 'pages#home'

  end
  
  namespace :admin do
  
    resources :pages
    resources :users
    resources :sessions

    root 'pages#index'
  end
end
