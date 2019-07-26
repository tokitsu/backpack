class FavoritesController < ApplicationController
  before_action :current_user
  before_action :authenticate_user, only: %i[index]

  def index
    @favorites = @current_user.favorites.page(params[:page])

  end

  def create
    user = current_user
    board = Board.find(params[:board_id])
    if Favorite.create(user_id: user.id, board_id: board.id)
      @favorites = Favorite.where(board_id: params[:board_id])
      @boards = Board.all
    else
      flash[:notice] = '登録できませんでした。'
      redirect_to boards_path
    end
  end

  def destroy
    user = current_user
    board = Board.find(params[:board_id])
    if favorite = Favorite.find_by(user_id: user.id,board_id: board.id)
      favorite.destroy
      @favorites = Favorite.where(board_id: params[:board_id])
      @boards = Board.all
    else
      flash[:notice] = 'お気に入り解除できませんでした。'
      redirect_to boards_path

    end
  end
end
