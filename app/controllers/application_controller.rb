class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_signed_in?
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end

  def redirect_if_authenticated
    redirect_to root_path, flash:{ info: "You Are Alread Signed in"} if user_signed_in?
  end

  private
  
  def require_login
    unless current_user
      redirect_to users_login_path, flash:{ danger: "You need to login first"}
    end
  end
end
