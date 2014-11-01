Rails.application.routes.draw do
  
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
