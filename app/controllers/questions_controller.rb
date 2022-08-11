class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit]
  before_action :set_question_for_current_user, only: %i[edit update destroy]
  before_action :hidden?, only: %i[hide visible]

  def create
    questions_params = params.require(:question).permit(:body, :user_id)

    @question = Question.new(questions_params)

    @question.author = current_user
    @question.hidden = true
    
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
    @question = Question.find(params[:id])
  end
  
  
  def index
    @questions = Question.order(created_at: :desc).first(10)
    
    @users = User.order(created_at: :desc).last(10)

    @hashtags = Hashtag.order(created_at: :desc).first(30)
  end
  
  def new
    @user = User.friendly.find(params[:user_id])
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

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def hidden?
    @question = Question.find(params[:id])
  end
end
