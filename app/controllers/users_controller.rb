class UsersController < ApplicationController
  def show
    # Find user by route id
    @user = User.find(params[:id])
  end

  def new
    # A user object for the form
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      #
    else
      render 'new'
    end


  end
end
