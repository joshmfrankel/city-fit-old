class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # Log the user in with the sessionHelper
      log_in user
      redirect_to user
    else
      # Flash.now is a special variant to be used with render
      # Flash can be reused on redirect
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  def destroy
    puts params
    # @user.destroy
    # redirect_to root_path
  end
end
