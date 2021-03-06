class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:message] = "Thanks for signing up!"
      redirect_to login_path
    else
      flash[:error] = "Please try again."
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :role)
  end
end
