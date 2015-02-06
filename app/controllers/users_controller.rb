class UsersController < ApplicationController
  def new
  end

  def show
    # Find user by route id
    @user = User.find(params[:id])
  end
end
