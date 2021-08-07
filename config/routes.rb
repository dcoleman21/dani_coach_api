Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      # resource :users, only: [:create]
      # post "/login", to: "users#login"
      resources :tournaments, only: [:index, :show] do
        resources :teams, only: [:index]
      end
      # story #4
      # api/v0/assessments?included=players
      resources :assessments, only: [:create]
      namespace :players do
        get "/:id", to: "assessments#index"
      end
      # resources :players
    end
  end
end
