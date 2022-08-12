class HashtagsController < ApplicationController
  before_action :set_user, only: %i[show]
  
  def show
    @questions = @hashtag.questions
  end

  private

  def set_user
    @hashtag = Hashtag.friendly.find(params[:name])
  end
end
