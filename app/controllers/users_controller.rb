class UsersController < ApplicationController
  def new
  end

  def create
    secret = BCrypt::Password.create(params["password"])

    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = params["password"]
    @user.save

    redirect_to "/login"
  end
end
