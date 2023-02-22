class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]
  
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid email or password"}
    end
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid email or password"}
    end
  end


  def auto_login
    render json: @user
  end

  def temp_set
    $redis.hset("myhkey", "key1", params[:value])
    # $redis.expire("myhkey", 3)
  end

  def temp_get
    render json: { "mykey": $redis.hget("myhkey", "key1")}
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
