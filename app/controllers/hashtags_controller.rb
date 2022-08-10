class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find(params[:id])
    
    @question = @hashtag.name
  end
end
