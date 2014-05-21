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

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = rating.new(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rating }
      else
        format.html { render action: 'new' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end
end
