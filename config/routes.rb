Rails.application.routes.draw do
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  get '/' => 'posts#index'

  resources :users do
    resources :posts
  end

  resources :posts do
        post 'upvote'
    resources :comments
  end
end
