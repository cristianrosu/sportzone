class ExploreController < ApplicationController
  def index
    @venues = Venue.all
  end

  def map
    @venues = Venue.all  # TODO geolocate ths query

    @venues_hash = Gmaps4rails.build_markers(@venues) do |venue, marker|
      marker.lat venue.latitude
      marker.lng venue.longitude
    end
  end
end
