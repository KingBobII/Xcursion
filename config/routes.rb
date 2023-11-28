Rails.application.routes.draw do
  devise_for :users
  #root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/xcursions', to: 'xcursions#index'
  get '/xcursions/:id', to: 'xcursions#show'
  get '/xcursions/new', to: 'xcursions#new'
  post '/xcursions', to: 'xcursions#create'
  get '/xcursions/:id/edit', to: 'xcursions#edit'
  patch '/xcursions/:id', to: 'xcursions#update'
  delete '/xcursions/:id', to: 'xcursions#destroy'
  post '/xcursions/:id/like', to: 'xcursions#like'
  post '/xcursions/:id/dislike', to: 'xcursions#dislike'
  get '/itineraries', to: 'itineraries#index'
  get '/itineraries/:id', to: 'itineraries#show'
  get 'xcursion/:id/itineraries/new', to: 'itineraries#new'
  post 'xcursion/:id/itineraries', to: 'itineraries#create'
  get 'xcursion/:id/itineraries/edit', to: 'itineraries#edit'
  patch 'xcursion/:id/itineraries/', to: 'itineraries#update'
  delete '/itineraries/:id', to: 'itineraries#destroy'
  get 'xcursion/:id/reviews/new', to: 'reviews#new'
  post 'xcursion/:id/reviews', to: 'reviews#create'
  get 'xcursion/:id/reviews/:id/edit', to: 'reviews#edit'
  patch 'xcursion/:id/reviews/:id', to: 'reviews#update'
  delete 'reviews/:id', to: 'reviews#destroy'
  get 'itinerary/:id/participants/new', to: 'participants#new'
  post 'itinerary/:id/participants', to: 'participants#create'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
