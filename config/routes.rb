Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      # resource :users, only: [:create]
      # post "/login", to: "users#login"
      resources :tournaments, only: [:index, :show] do
        resources :teams, only: [:index]
      end
      # story #4
      # api/v0/players/id/assessments
      # resources :players do
      #   #assessment controller
      #   resources :assessments, only: [:index]
      # end
    end
  end
end
