class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def login
    @user = User.new
  end

  def logging
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = "Something went wrong! Please check your username and password and try again."
      redirect_to users_login_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

private

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end



end
