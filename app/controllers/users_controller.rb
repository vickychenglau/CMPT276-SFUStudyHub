class UsersController < ApplicationController
#before_filter :authorize, :only => [:list]
#before_filter :save_login_state, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @pass = params[:user][:password]
    @passconfirm = params[:user][:password_confirmation]

    @user = User.new(user_params)
    if @pass != @passconfirm
      @user.errors.add(:password_confirmation, " and Password do not match")
    end
    @user.role = "user"
    if @pass == @passconfirm && @user.save
      flash[:notice] = "You signed up successfully"
      redirect_to login_path
    else
      flash[:notice] = "Sign up failed. Please fix the errors listed below this form."
      render "new"
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User updated"
      if @user.role == 'admin'
        redirect_to users_list_path
      else
        redirect_to user_path
      end
    else
      flash[:notice] = "User not updated"
      render 'edit'
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

  def show
    @user = User.find(params[:id])
    @topics = Topic.where(user_id: @user.id)
    @posts = Post.where(user_id: @user.id)
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :last_name, :first_name, :password, :role)
    end

end
