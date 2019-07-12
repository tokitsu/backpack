class UsersController < ApplicationController

  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to :back, flash: {
        user:user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def show
    @user = @current_user.boards.page(params[:page])
    @user = @current_user
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

end
