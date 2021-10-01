Rails.application.routes.draw do
  resources :events
  devise_for :users
  root to: 'homes#top'
  get 'fav' => 'favorites#fav', as: 'favorites'
  resources :plans, only: [:new, :create, :index, :show, :destroy] do
   resources :plan_comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index] do
   resource :relationships, only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers', as: 'followers'
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
