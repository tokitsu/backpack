class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user
    if @current_user == nil
      flash[:notice] = 'ログインしてください'
      redirect_to login_path
    else
    end
  end

  def current_user
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
  end

end
