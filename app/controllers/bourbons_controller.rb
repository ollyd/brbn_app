class BourbonsController < ApplicationController
  before_action :set_bourbon, only: [:show, :edit, :update, :destroy]

  # GET /bourbons
  # GET /bourbons.json
  def index
    @bourbons = Bourbon.all

    respond_to do |format|
      format.html 
      format.json { render json: @bourbons, :include => [:ratings] }
    end
  end

  # GET /bourbons/1
  # GET /bourbons/1.json
  def show
  end

  # GET /bourbons/new
  def new
    @bourbon = Bourbon.new
  end

  # GET /bourbons/1/edit
  def edit
  end

  # POST /bourbons
  # POST /bourbons.json
  def create
    @bourbon = Bourbon.new(bourbon_params)

    respond_to do |format|
      if @bourbon.save
        format.html { redirect_to @bourbon, notice: 'Bourbon was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bourbon }
      else
        format.html { render action: 'new' }
        format.json { render json: @bourbon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bourbons/1
  # PATCH/PUT /bourbons/1.json
  def update
    respond_to do |format|
      if @bourbon.update(bourbon_params)
        format.html { redirect_to @bourbon, notice: 'Bourbon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bourbon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bourbons/1
  # DELETE /bourbons/1.json
  def destroy
    @bourbon.destroy
    respond_to do |format|
      format.html { redirect_to bourbons_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bourbon
      @bourbon = Bourbon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bourbon_params
      params.require(:bourbon).permit(:name, :alcohol, :image, :description, :toffee, :woody, :tannic, :char, :sweet, :grainy, :vanilla, :corny, :buttery, :heat, :dark_fruit, :citrus_fruit, :floral, :spicy, :herbal, :malty)
    end
end
