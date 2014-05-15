class RatingsController < ApplicationController
  def index
    @ratings = Rating.all

    respond_to do |format|
      format.html 
      format.json { render json: @ratings }
    end
  end

  def new
  end

  def update
    @rating = Rating.find(params[:id])
    
    if @rating.update_attributes(score: params[:score])
      respond_to do |format|
        format.js
      end
    end
  end
end
