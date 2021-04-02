Rails.application.routes.draw do
  devise_for :users

  resources :users,only: [:show,:index,:edit,:update]
  
  resources :books do
   resources :post_comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
  end
  
  root 'homes#top'
  get 'home/about' => 'homes#about'

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  
  get 'relationships/follower' => 'relationships#follower'
  get 'relationships/following' => 'relationships#following'

end