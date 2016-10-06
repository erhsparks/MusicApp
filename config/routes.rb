Rails.application.routes.draw do
  root to: redirect('/users/1')

  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]

  resources :bands
  resources :albums, :tracks, only: [:create, :new, :edit, :show, :update, :destroy]
end
