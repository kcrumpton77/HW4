class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by({ "email" => params["email"] })
    if user
      secret = BCrypt::Password.new(user["password"])
      if secret == params["password"]
        session["user_id"] = user["id"]
        redirect_to "/places"
      else
        flash["notice"] = "Invalid email or password"
        redirect_to "/login"
      end
    else
      flash["notice"] = "Invalid email or password"
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    redirect_to "/login"
  end
end
  