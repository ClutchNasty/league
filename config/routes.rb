Rails.application.routes.draw do
  root "league#index"
  devise_for :users
  resources :leagues
end
