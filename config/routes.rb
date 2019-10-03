Rails.application.routes.draw do
  resources :books
  resources :customers
  resources :showad, only: [:show]
  resources :ads, :except => [:show]
  get 'welcome/index'
  get 'welcome/:id', to: 'welcome#show'

  devise_for :users
  resources :users, :except => [:show]
  get 'home/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
