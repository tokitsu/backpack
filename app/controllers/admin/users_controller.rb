class Admin::UsersController < ApplicationController
  before_action :admin_user

  def new
    @user = User.new
  end

  def create
    user = User.new(admin_user_params)
    if user.save
      redirect_to admin_users_path
    else
      redirect_to admin_new_users_path, flash:{
        user: user,
        error_messages: user.errors.full_messages
      }
    end

  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def admin_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def admin_user
    redirect_to (user_path(@current_user)) unless current_user.admin?
  end
end
