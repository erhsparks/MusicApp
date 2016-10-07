Rails.application.routes.draw do
  root to: redirect('/bands')

  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]

  resources :bands

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, :tracks, only: [:create, :new, :edit, :show, :update, :destroy]

  resources :albums, only: [:create, :destroy, :edit, :show, :update] do
    resources :tracks, only: [:new]
  end
end
