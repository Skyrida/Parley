Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :debates do
    resources :arguments, only: [:index, :show, :new, :create, :destroy]
  end

  resources :arguments, only: [] do
    resources :comment_like_users, only: [:new, :create]
    resources :comment_swipe_users, only: [:new, :create]
  end

  resources :chatrooms do
    resources :messages, only: [:new, :create]
    resources :reflections, only: [:show, :new, :create]
  end
end
