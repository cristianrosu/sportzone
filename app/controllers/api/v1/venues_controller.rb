module Api::V1
  class VenuesController < ApplicationController
    def index
      venues = Venue.includes(:sports).all
      @venues_json = VenuePresenter.wrap(venues).map(&:to_json)

      render json: @venues_json
    end

    def show
      venue = Venue.includes(:sports).find(params[:id])
      @venue_json = VenuePresenter.new(venue).to_json

      render json: @venue_json
    end
  end
end
