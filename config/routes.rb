Rails.application.routes.draw do
  get 'home/index'
  resources :bars, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :reviews, only: [:index, :show, :new, :create]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  namespace :admin do
    resources :bars, except: [:index, :show] # ⛔ Empêche la duplication avec les routes publiques
    resources :events, except: [:index, :show]
    resources :reviews, except: [:index, :show, :new, :create] # Laisse les avis publics mais protège la suppression
    resources :users, only: [:index, :show, :update, :destroy] # Permet à l'admin de gérer les utilisateurs
  end

  root to: "bars#index"
end
