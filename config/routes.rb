Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      # resource :users, only: [:create]
      # post "/login", to: "users#login"
      # resources :tournaments
      get "/tournaments", to: "tournaments#index"
      get "/tournaments/:id", to: "tournaments#show"
    end
  end
end
