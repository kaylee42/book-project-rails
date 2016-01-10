class UsersController < ApplicationController
  def index
    @users = User.all.sort_by {|user| user.username.downcase}
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Account created!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to @user
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      if params[:user][:password]
        redirect_to @user, notice: "Password successfully changed!"
      elsif params[:user][:bio]
        redirect_to @user, notice: "Account info successfully updated!"
      end
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Account successfully deleted."
  end

  def search
    search_term = params[:keyword]
    if user = User.find_by(username: search_term)
      redirect_to user
    else
      @users = Search.users(search_term).sort_by {|user| user.username}
        if @users == []
          redirect_to users_path, notice: "Sorry, couldn't find what you were looking for! Please try again."
        end
    end
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
    redirect_to root_path, notice: "You have been successfully logged out."
  end

private

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation, :bio)
  end



end
