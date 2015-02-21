module Api::V1
  class SportsController < ApplicationController
    before_action :set_sport, only: [:show]

    # GET /sports
    def index
      @sports = Sport.all
    end

    # GET /sports/1
    def show
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_sport
        @sport = Sport.find(params[:id])
      end
  end
end
