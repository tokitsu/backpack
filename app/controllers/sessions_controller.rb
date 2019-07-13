class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:notice] = 'メールアドレスかパスワードに誤りがあります。'
      redirect_back fallback_location: login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
