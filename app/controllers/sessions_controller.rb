class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])

    else
      # Flash.now is a special variant to be used with render
      # Flash can be reused on redirect
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  def destroy
  end
end
