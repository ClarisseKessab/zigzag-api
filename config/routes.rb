Rails.application.routes.draw do
  resources :bars, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :reviews, only: [:index, :show, :new, :create]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  namespace :admin do
    resources :bars
    resources :events
    resources :reviews
    resources :users
  end

  root to: 'home#index'
end
