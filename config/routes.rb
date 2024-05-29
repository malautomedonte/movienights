Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  # resources :bookmarks, only:[:create, :destroy, :index ]
  resources :movies, only:[:index]
  resources :events, only:[:index, :create]
end
