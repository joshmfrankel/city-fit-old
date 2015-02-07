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
    # Pass in the strong parameters
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome to CityFit"
      redirect_to @user
    else
      render 'new'
    end
  end

    private

      # Strong Parameters
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
end
