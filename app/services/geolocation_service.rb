class GeolocationService
  def initialize(location)
    @location = location
  end

  ## Get location requested by user through the search form
  #  or default to Cluj
  def location
    if @location.blank?
      Geocoder.search('Cluj').first
    else
      Geocoder.search(@location).first
    end
  end
end
