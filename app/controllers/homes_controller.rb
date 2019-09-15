class HomesController < ApplicationController
  def index
    @user = User.new
    render :layout => 'second_layout'
  end
end
