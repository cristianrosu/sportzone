module GoogleMapsHelper
  def google_maps_api_key
    '' # it works without an API key for now
  end

  def google_maps_root_url
    'http://maps.googleapis.com/maps/api/js'
  end

  def google_maps_api_url
    "#{google_maps_root_url}?v=3.18"
  end
end
