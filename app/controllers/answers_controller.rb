class AnswersController < ApplicationController
  def create
    @answer = Answer.new (answer_params.merge(user_id: @current_user.id))
    if @answer.save
      flash[:notice] = 'コメントを投稿しました。'
      redirect_to @answer.question
    else
      redirect_back fallback_location: @answer.question, flash: {
        answer: @answer,
        error_messages: @answer.errors.full_messages
      }
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to @answer.question, flash: {notice: 'コメントが削除されました。'}
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :body)
  end
end
