class UsersController < ApplicationController

  # Call the logged_in_user method before the update and edit action only
  before_action :logged_in_user, only: [:edit, :update]

  # Check for the correct user on the edit and update actions
  before_action :correct_user, only: [:edit, :update]

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
      log_in @user
      flash[:success] = "Welcome to CityFit"
      redirect_to @user
    else
      render 'new'
    end
  end

  # @user defined in correct_user filter
  def edit
  end

  # @user defined in correct_user filter
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

    private

      # Strong Parameters
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

      # Confirms a logged-in user.
      def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
      end

      # Confirms the correct user.
      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
      end
end
