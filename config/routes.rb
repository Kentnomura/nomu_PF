Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  get "search" => "searches#search"
  resources :post_animals, only: [:new, :index, :show, :create, :destroy]do
    resource :favorites, only: [:create, :destroy]
    resources :animal_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :index, :edit, :update]do
     member do
      get :favorites
    end
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
