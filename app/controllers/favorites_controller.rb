class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end

  def create
    user = current_user
    board = Board.find(params[:board_id])
    if Favorite.create(user_id: user.id, board_id: board.id)
      flash[:notice] = 'お気に入り登録しました。'
      redirect_to boards_path
    else
      flash[:notice] = '登録できませんでした。'
      redirect_to boards_path
    end
  end

  def destroy
    user = current_user
    board = Board.find(params[:board_id])
    if favorite = Favorite.find_by(user_id: user.id,board_id: board.id)
      Favorite.destroy
      redirect_to boards_path
      flash[:notice] = 'お気に入り解除しました。'
    else
      flash[:notice] = 'お気に入り解除できませんでした。'
      redirect_to boards_path

    end
  end
end
