Rails.application.routes.draw do
  root to: redirect('/users/1')

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
