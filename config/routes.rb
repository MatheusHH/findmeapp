Rails.application.routes.draw do
  resources :campaigns, :except => [:show]
  get 'chart/index'
  resources :budgets
  resources :categories, :except => [:show] 
  resources :services, :except => [:show]
  resources :books, :except => [:show]
  resources :customers, :except => [:show]
  resources :showad, only: [:show]
  resources :ads, :except => [:show]
  resources :ad_by_category, only: [:show]
  get 'welcome/index'
  get 'welcome/:id', to: 'welcome#show'

  devise_for :users
  resources :users, :except => [:show]
  get 'home/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
