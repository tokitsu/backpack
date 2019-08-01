class CommentsController < ApplicationController
  before_action :current_user, only: %i[create destroy]

  def create
    @comment = Comment.new (comment_params.merge(user_id: @current_user.id))
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to blog_path(@blog), notice: '投稿できませんでした...' }
      end
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
