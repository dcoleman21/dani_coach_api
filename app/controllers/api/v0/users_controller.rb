class Api::V0::UsersController < ApplicationController
  # def login
  #   @user = User.find_by(email: params[:email])
  #
  #   if @user && @user.authenticate(params[:password])
  #     jwt_token = JWT.encode(@user.to_json, ENV['JWT_SECRET_KEY'], 'HS256')
  #     render json: {auth_token: jwt_token, message: "user authenticated"}
  #   else
  #     render json: {data:{message: "Invalid user credentials"} }
  #   end
  # end

  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
