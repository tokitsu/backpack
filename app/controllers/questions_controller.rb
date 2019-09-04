class QuestionsController < ApplicationController
  before_action :current_user
  before_action :authenticate_user
  before_action :set_target_question, only: %i[show edit update destroy]
  before_action :question_collect_user, only: %i[edit]

  def index
    @user = @current_user
    @questions = Question.page(params[:page])
  end


  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params.merge(user_id: @current_user.id))
    if question.save
      flash[:notice] = "「#{question.title}」の質問が作成されました。"
      redirect_to question_path(question)
    else
      redirect_to new_question_path, flash:{
        question: question,
        error_messages: question.errors.full_messages
      }
    end
  end

  def show
    @answer = Answer.new(question_id: @question.id)
  end

  def edit
  end

  def update
    if @question.update(question_params.merge(user_id: @current_user.id))
      flash[:notice] = "「#{@question.title}」の質問が編集されました"
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question), flash:{
        question: @question,
        error_messages: qusetion.errors.full_messages
      }
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, flash: { notice: "「 #{@question.title}」の質問が削除されました"}
  end


  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_target_question
    @question = Question.find(params[:id])
  end

  def question_collect_user
    if @current_user.id != @question.user_id
      flash[:notice] = "あなたには権限がありません。"
      redirect_to questions_path
    end
  end

end
