class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find_by(params[:id])
    
    @question = @hashtag.questions
  end
end
