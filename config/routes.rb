Rails.application.routes.draw do

  get 'searchs/search'
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  root 'home#top'
  get 'home/about'

  resources :users, only: [:show, :index, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :books do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

end

