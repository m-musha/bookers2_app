Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'search' => 'searches#search'
  resources :users, only: [:edit, :update, :index, :show] do
   member do 
    get 'following'
    get 'follower'
   end
  end 
  resources :books, only: [:edit, :create, :index, :show, :update, :destroy] do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
end
