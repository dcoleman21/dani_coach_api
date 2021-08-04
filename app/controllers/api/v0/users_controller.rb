class Api::V0::UsersController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      jwt_token = JWT.encode(@user.to_json, ENV['JWT_SECRET_KEY'], 'HS256')
      render json: {auth_token: jwt_token, message: "user authenticated"}
    else
      render json: {data:{message: "Invalid user credentials"} }
    end
  end
end
