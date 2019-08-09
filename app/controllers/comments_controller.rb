class CommentsController < ApplicationController
  before_action :current_user, only: %i[create destroy]

  def create
    @comment = Comment.new (comment_params.merge(user_id: @current_user.id))
      if @comment.save
      @board = @comment.board
      else
        redirect_to @comment.board, flash: {notice: '投稿できませんでした...' }
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.board, flash: {notice: 'コメントが削除されました。'}
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id, :comment)
  end
end
