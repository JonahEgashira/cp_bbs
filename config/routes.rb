Rails.application.routes.draw do


  #ログイン関係
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  #ユーザー関係
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"


  #投稿関係
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  #コメント
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  #ホーム、about
  get "/" => "home#top"
  get "about" => "home#about"
  get 'posts/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
