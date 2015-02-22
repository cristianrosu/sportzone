class VenueFilter
  def initialize(location, params)
    @location = location
    @query = params[:query]
  end

  def venues
    Venue.sports_in(@query).in_bounds(@location)  # TODO geolocate ths query
  end
end
