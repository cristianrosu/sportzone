class ExploreController < ApplicationController
  def index
    @venues = Venue.all
  end

  def map
    if params[:query]
      @venues = Venue.includes(:sports).where(sports: { id: params[:query] })  # TODO geolocate ths query
    else
      @venues = Venue.all  # TODO geolocate ths query
    end

    @sports = Sport.all
  end
end
