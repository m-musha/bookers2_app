Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books, only: [:edit, :create, :index, :show, :update, :destroy]
  resources :users, only: [:edit, :update, :index, :show]

end
