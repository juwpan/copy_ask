class QuestionsController < ApplicationController
  before_action :set_question, only: %i[edit update show destroy hide visible]

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path(@question), notice: "New question create!"
    else
      flash[:alert] = "The form has been filled out incorrectly"

      render :new
    end
  end

  def update
    @question.update(question_params)

    if @question.save
      redirect_to question_path(@question), notice: 'Question save!'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    respond_to do |format|
      format.html {redirect_to questions_path, status: :see_other, notice: 'Question delete!'}
      format.json {head :no_content}
    end
  end

  def show
  end

  def visible
    @question.update(hidden: false)

    redirect_to questions_path
  end

  def index
    @question = Question.new

    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
  end
  
  def hide
    @question.update(hidden: true)

    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
