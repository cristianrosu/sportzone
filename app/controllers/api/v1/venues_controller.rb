module Api::V1
  class VenuesController < ApplicationController
    def index
      @location = GeolocationService.new(params[:location]).location
      venues = VenueFilter.new(@location, params).venues
      @venues_json = VenuePresenter.wrap(venues).map(&:to_json)

      render json: {
        location: @location.to_hash,
        venues: @venues_json
      }
    end

    def show
      venue = Venue.includes(:sports).find(params[:id])
      @venue_json = VenuePresenter.new(venue).to_json

      render json: @venue_json
    end
  end
end
