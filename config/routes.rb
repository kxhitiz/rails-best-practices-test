Blog::Application.routes.draw do |map|
  resources :users do
    resources :posts
    # resources :posts do
    #       resources :comments
    #     end
  end

  resources :posts do
    resouces :comments
  end

  root :to => "posts#index"

  resources :user_sessions

  match 'login' => "user_sessions#new"
end

