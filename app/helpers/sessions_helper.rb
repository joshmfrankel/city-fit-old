module SessionsHelper

  # Log the user in
  def log_in(user)
    session[:user_id] = user.id
  end

  # FInd user by id unless current user already set
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise
  def logged_in?
    !current_user.nil?
  end

  # Log out
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
