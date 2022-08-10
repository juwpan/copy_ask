class QuestionsController < ApplicationController
  before_action :set_question_for_current_user, only: %i[edit update destroy hide visible]

  def create
    questions_params = params.require(:question).permit(:body, :user_id)
    
    @question = Question.new(questions_params)
    
    if @question.author_id == nil
      @question.author_id = current_user.id
    end

    if @question.save
      redirect_to user_path(@question.user), notice: I18n.t("controller.new_question_create!")
    else
      flash[:alert] = I18n.t("controller.the_form_has_been_filled_out_incorrectly")

      render :new
    end
  end

  def update
    questions_params = params.require(:question).permit(:body, :answer)
    
    @question.update(questions_params)

    if @question.save
      redirect_to user_path(@question.user), notice: I18n.t("controller.question_save")
    else
      render :edit
    end
  end

  def destroy
    @user = @question.user

    @question.destroy

    redirect_to user_path(@user), status: :see_other, notice: I18n.t("controller.question_delete")
  end

  def show    
    @question = Question.find_by(params[:id])
  end

  
  def index
    @question = Question.new
    
    @questions = Question.order(created_at: :desc)

    @hashtags = Hashtag.all
  end
  
  def new
    @user = User.find(params[:user_id])
    
    @question = Question.new(user: @user)
  end
  
  def edit
  end
  
  def visible
    @question.update(hidden: false)

    redirect_to root_path
  end
  
  def hide
    @question.update(hidden: true)
    
    redirect_to root_path
  end

  private

  def show_order
    @question.order(created_at: :desc)
  end

  def create_author
    params.require(:question).permit(:author)
  end

  def ensure_current_user
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
