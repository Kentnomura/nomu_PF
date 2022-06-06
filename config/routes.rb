Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  get "search" => "searches#search"
  resources :post_animals, only: [:new, :index, :show, :create]do
    resource :favorites, only: [:create, :destroy]
    resources :animal_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit]do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
