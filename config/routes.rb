Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      # resource :users, only: [:create]
      # post "/login", to: "users#login"
      get "/tournaments", to: "tournaments#index"
    end
  end
end
