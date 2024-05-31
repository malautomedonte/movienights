Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}

  root "pages#home"

  # resources :bookmarks, only:[:create, :destroy, :index ]
  resources :movies, only:[:index]
  resources :events do
  resources :messages, only: :create
  end
  resources :event_users, only: %i[create update destroy]
  get '/pages/myevents', to: 'pages#myevents'
end
