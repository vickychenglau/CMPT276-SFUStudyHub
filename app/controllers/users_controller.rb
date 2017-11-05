class UsersController < ApplicationController

before_filter :save_login_state, :only => [:new, :create]

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      redirect_to login_path
    else
      flash[:notice] = "Sign up failed. Please fix the errors listed below this form."
      render "new"
    end

  end

  def list
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_list_path
  end


  private
    def user_params
      params.require(:user).permit(:username, :email, :last_name, :first_name, :password)
    end
  
end
