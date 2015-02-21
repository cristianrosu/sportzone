class ExploreController < ApplicationController
  def index
    @venues = Venue.all
  end

  def map

    # get location requested by user through the search form or current user location
    @location = params[:location].blank? ? Geocoder.search("Cluj").first : Geocoder.search(params[:location]).first

    if params[:query]
      @venues = Venue.includes(:sports).where(sports: { id: params[:query] }).near([@location.latitude, @location.longitude], 40)  # TODO geolocate ths query
    else
      @venues = Venue.all.near([@location.latitude, @location.longitude], 40)
    end

    @sports = Sport.all

    @venues_hash = Gmaps4rails.build_markers(@venues) do |venue, marker|
      marker.lat venue.latitude
      marker.lng venue.longitude
    end
  end
end
