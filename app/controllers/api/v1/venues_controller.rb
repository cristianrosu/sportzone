module Api::V1
  class VenuesController < ApplicationController
    def index
      @location = GeolocationService.new(params[:location]).location
      venues = VenueFilter.new(@location, params).venues
      @venues_json = VenuePresenter.wrap(venues).map(&:to_json)

      # TODO: I am ugly, changeme
      render json: {
        location: {
          latitude: @location.latitude,
          longitude: @location.longitude
        },
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
