class ClicksController < ApplicationController
  before_action :set_click, only: %i[ show edit update destroy ]

  # GET /clicks or /clicks.json
  def index
    @clicks = Click.all
  # The `geocoded` scope filters only flats with coordinates
    @markers = @clicks.geocoded.map do |click|
      {
        lat: click.latitude,
        lng: click.longitude
      }
    end

    # get country
    @data = []
    @clicks.each do |click|
      result = Geocoder.search([click.latitude, click.longitude])
      country = result.first.country
      @data << country
    end

    @data_hash = Hash.new(0)
    @data.each{|key| @data_hash[key] += 1}
    # raise
  end

  # GET /clicks/1 or /clicks/1.json
  def show
  end

  # GET /clicks/new
  def new
    @click = Click.new
  end

  # GET /clicks/1/edit
  def edit
  end

  # POST /clicks or /clicks.json
  def create
    @click = Click.new(click_params)

    respond_to do |format|
      if @click.save
        format.html { redirect_to click_url(@click), notice: "Click was successfully created." }
        format.json { render :show, status: :created, location: @click }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @click.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clicks/1 or /clicks/1.json
  def update
    respond_to do |format|
      if @click.update(click_params)
        format.html { redirect_to click_url(@click), notice: "Click was successfully updated." }
        format.json { render :show, status: :ok, location: @click }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @click.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clicks/1 or /clicks/1.json
  def destroy
    @click.destroy

    respond_to do |format|
      format.html { redirect_to clicks_url, notice: "Click was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_click
      @click = Click.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def click_params
      params.require(:click).permit(:name, :address)
    end
end
