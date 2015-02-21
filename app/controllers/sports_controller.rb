class SportsController < ApplicationController
  before_action :set_sport, only: [:show, :edit, :update, :destroy]

  # GET /sports
  def index
    @sports = Sport.all
  end

  # GET /sports/1
  def show
  end

  # GET /sports/new
  def new
    @sport = Sport.new
  end

  # GET /sports/1/edit
  def edit
  end

  # POST /sports
  def create
    @sport = Sport.new(sport_params)

    if @sport.save
      redirect_to @sport, notice: 'Sport was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sports/1
  def update
    if @sport.update(sport_params)
      redirect_to @sport, notice: 'Sport was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sports/1
  def destroy
    @sport.destroy
    redirect_to sports_url, notice: 'Sport was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport
      @sport = Sport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sport_params
      params.require(:sport).permit(:name, :description)
    end
end
