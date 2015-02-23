module GoogleMapsHelper
  def google_maps_api_key
    #TODO move this in some config file
    #don-t use this key in your own project, it only works for domain http://sportzone.herokuapp.com
    'AIzaSyBi-pdTqdVRjcTGQlKYcO06DrnT-QSmjSM'
  end

  def google_maps_root_url
    'http://maps.googleapis.com/maps/api/js'
  end

  def google_maps_api_url
    "#{google_maps_root_url}?key=#{google_maps_api_key}"
  end
end
