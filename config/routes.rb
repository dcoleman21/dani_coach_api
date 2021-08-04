Rails.application.routes.draw do
  resource :users, only: [:create]
  # used for logging in
  post "/login", to: "users#login"
  # verify logged in using JWT
  get "/auto_login", to: "user#auto_login"
end
