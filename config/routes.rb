Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  get 'users/my_portfolio'
  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'friends_list', to: 'friends#friends_list'
  get 'search_friend', to: 'friends#search'
end
