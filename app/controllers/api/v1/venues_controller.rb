module Api::V1
  class VenuesController < ApplicationController
    before_action :set_venue, only: [:show]

    def index
      @venues = Venue.all
    end

    def show
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_venue
        @venue = Venue.find(params[:id])
      end
  end
end
