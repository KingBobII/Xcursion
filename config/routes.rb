Rails.application.routes.draw do
  devise_for :users
  root to: "excursions#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :excursions do
    resources :reviews, only: [:new, :create, :edit, :update, :delete]
  end

  resources :itineraries do
    resources :participants, only: [:new, :create, :update ,:delete]
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
