Rails.application.routes.draw do
  root to: redirect('/users/1')

  resources :users, only: [:new, :create, :show]
  resource :sessions, only: [:new, :create, :destroy]
end
