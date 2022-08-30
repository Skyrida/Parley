Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :debates, only: [:index, :show, :new, :create, :destroy] do
    resources :arguments, only: [:index, :new, :create]
  end

  resources :arguments, only: [:destroy] do
    resources :comment_like_users, only: [:create]
    resources :comment_swipe_users, only: [:create]
  end

  resources :chatrooms, only: [:index, :show, :create] do
    resources :messages, only: [:create]
    resources :reflections, only: [:new, :create]
  end

  resources :reflections, only: [:show]
end
