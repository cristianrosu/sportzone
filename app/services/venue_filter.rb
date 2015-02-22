class VenueFilter
  def initialize(location, params)
    @location = location
    @query = params[:query]
  end

  def venues
    Venue.sports_in(@query).near([@location.latitude, @location.longitude], 40)  # TODO geolocate ths query
  end
end
