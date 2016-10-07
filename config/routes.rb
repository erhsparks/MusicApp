Rails.application.routes.draw do
  root to: redirect('/bands')

  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]

  resources :bands
  resources :albums, :tracks, only: [:create, :new, :edit, :show, :update, :destroy]
end
