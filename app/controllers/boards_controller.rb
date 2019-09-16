class BoardsController < ApplicationController
  before_action :current_user
  before_action :authenticate_user
  before_action :set_target_board, only: %i[show edit update destroy]
  before_action :board_collect_user, only: %i[edit]

  def index
    @user = @current_user
    @search = Board.ransack(params[:q])
    @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
    @boards = @boards.page(params[:page])
  end

  def search
    @search = Board.ransack(params[:q])
    @boards = @search.result.page(params[:page])
    render "index"
  end

  def new
    @board = Board.new
  end

  def create
    board = Board.new(board_params.merge(user_id: @current_user.id))
    if board.save
      flash[:notice] = "「#{board.title}」のノートが作成されました。"
      redirect_to board_path(board)
    else
      redirect_to new_board_path, flash:{
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new(board_id: @board.id)
    @comments = @board.comments
  end

  def edit
  end

  def update
    if @board.update(board_params.merge(user_id: @current_user.id))
      flash[:notice] = "「#{@board.title}」のノートが編集されました"
      redirect_to board_path(@board)
    else
      redirect_to board_path(@board), flash:{
        board: @board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, flash: { notice: "「 #{@board.title}」のノートが削除されました"}
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :country, :city, images: [], tag_ids: [])
  end

  def set_target_board
    @board = Board.find(params[:id])
  end

  def board_collect_user
    if @current_user.id != @board.user_id
      flash[:notice] = "あなたには権限がありません。"
      redirect_to boards_path
    end
  end

end
