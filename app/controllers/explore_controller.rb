class ExploreController < ApplicationController
  def index
    @venues = Venue.all
  end

  def map
    location = GeolocationService.new(params[:location]).location
    @location = LocationPresenter.new(location)
    @venues = VenueFilter.new(@location, params).venues

    @venues_json = VenuePresenter.wrap(@venues).map(&:to_json).to_json # Last one converts from Ruby Hash to JSON string
    @sports = Sport.all
  end
end
