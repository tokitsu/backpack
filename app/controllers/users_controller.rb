class UsersController < ApplicationController
  before_action :current_user, only: %i[show edit index]
  before_action :authenticate_user, only: %i[edit show]
  before_action :collect_user, only: %i[edit]

  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_back fallback_location: new_user_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_back fallback_location: edit_user_path, flash: {
        user: @user,
        error_messages: @user.errors.full_messages
      }
    end
  end

  private

  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :age, :sex, :favorite_country, :country_you_want_to_go, :introduction)
  end

  def collect_user
    if @current_user.id != params[:id].to_i
    flash[:notice] = "あなたには権限がありません。"
    redirect_to user_path(@current_user)
    end
  end

end
