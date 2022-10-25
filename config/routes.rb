Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  devise_for :users

  get "home/about" => "homes#about"
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    resource  :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create,:destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers'  => 'relationships#followers',  as: 'followers'
    get "search", to: "users#search"
  end
  get "search" => "searches#search"
  resources :rooms,    only: [:create, :index, :show]
  resources :messages, only: [:create]
  resources :groups do
    get "join" => "groups#join"
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end