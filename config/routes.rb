Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root "pages#home"

  resources :movies, only: %i[index show] do
    resources :reviews, only: %i[new create]
  end

  resources :events do
    resources :messages, only: :create
  end

  resources :event_users, only: %i[create update destroy]
  resources :friendships, only: %i[index create] do
    member do
      patch 'accept', to: 'friendships#accept'
      patch 'reject', to: 'friendships#reject'
    end
  end

  get '/profile/:id', to: 'pages#profile', as: "profile"
  get '/pages/myevents', to: 'pages#myevents'
  get '/friendrequests', to: 'friendships#friend_requests'
  get '/pages/user_profile', to: 'pages#user_profile'
  get 'about', to: 'pages#about'
end
