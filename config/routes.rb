Rails.application.routes.draw do
  get 'inspirations/new'
  get 'inspirations/create'
  devise_for :users
  root to: "excursions#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :excursions do
    collection do
      get 'search_excursions', to: 'search_excursions#search', as: :search_excursions
    end
    resources :reviews
  end

  #Upvote and Downvote on Excursion
  resources :excursions do
    member do
      put "like", to: "excursions#upvote"
      put "dislike", to: "excursions#downvote"
    end
  end

  resources :itineraries do
    resources :participants, only: [:new, :create, :update ,:delete]
    # resources :chatrooms, only: :show do
    resources :itinerary_messages, only: :create
    # end
  end

  resources :inspirations, only: [:new, :create, :show]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"




end
