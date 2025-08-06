Rails.application.routes.draw do
  devise_for :users
  root "events#index"

  resources :events do
    resources :participations, only: [:create, :destroy]
  end
end
