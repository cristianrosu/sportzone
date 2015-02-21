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

    @venues_json = VenuePresenter.wrap(@venues).map(&:to_json).to_json # Last one converts from Ruby Hash to JSON string
    @sports = Sport.all
  end
end
