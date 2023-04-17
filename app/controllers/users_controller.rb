class UsersController < ApplicationController
  before_action :redirect_if_authenticated, only: [:new, :create, :login, :authentication]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:danger] = "Enter all The details"
      render :new, status: :unprocessable_entity
    end
  end

  def login
  end

  def authentication
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Login Successfully."
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid Email Or Password."
      render :login, status: :unprocessable_entity
    end
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
    flash[:success] = "Logout Successfully."
    redirect_to users_login_path
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
