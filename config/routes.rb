Rails.application.routes.draw do
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admin, only: [:session, :pasword]
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :post, only: [:show, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  
  namespace :admin do
    resources :post, only: [:new, :create, :destroy]
  end
end
