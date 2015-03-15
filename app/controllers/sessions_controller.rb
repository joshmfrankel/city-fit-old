class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # Log the user in with the sessionHelper
      log_in user

      # Remember me
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)

      redirect_back_or user
    else
      # Flash.now is a special variant to be used with render
      # Flash can be reused on redirect
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  def destroy
    # only log out if already logged in
    log_out if logged_in?
    redirect_to root_url
  end
end
