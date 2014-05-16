class RatingsController < ApplicationController
  def index
    @ratings = Rating.all

    respond_to do |format|
      format.html 
      format.json { render json: @ratings }
    end
  end

  def new
    @rating = Rating.new
  end

  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully added.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
    #@rating = Rating.find(params[:id])
    # if @rating.update_attributes(score: params[:score])
    #   respond_to do |format|
    #     format.json
    #   end
    # end
  end
end
