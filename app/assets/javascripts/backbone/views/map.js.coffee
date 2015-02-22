class Sportzone.Views.Map extends Backbone.View
  styleArray: [{"featureType":"water","stylers":[{"saturation":43},{"lightness":-11},{"hue":"#0088ff"}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"hue":"#ff0000"},{"saturation":-100},{"lightness":99}]},{"featureType":"road","elementType":"geometry.stroke","stylers":[{"color":"#808080"},{"lightness":54}]},{"featureType":"landscape.man_made","elementType":"geometry.fill","stylers":[{"color":"#ece2d9"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#ccdca1"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#767676"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"}]},{"featureType":"poi","stylers":[{"visibility":"off"}]},{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"color":"#b8cb93"}]},{"featureType":"poi.park","stylers":[{"visibility":"on"}]},{"featureType":"poi.sports_complex","stylers":[{"visibility":"on"}]},{"featureType":"poi.medical","stylers":[{"visibility":"on"}]},{"featureType":"poi.business","stylers":[{"visibility":"simplified"}]}]

  initialize: ({location}) ->
    @location = location

    @listenTo(@location, 'change', @_fitBounds)

  render: ->
    @_renderMap()
    this

  _renderMap: ->
    @map = new google.maps.Map(@_mapElement(), @_mapOptions())
    @_fitBounds()

  _changeCenter: ->
    @map.panTo(@_mapCenter())

  _fitBounds: ->
    sw = new google.maps.LatLng(@location.get('bottom'), @location.get('left'))
    ne = new google.maps.LatLng(@location.get('top'), @location.get('right'))
    @map.fitBounds(new google.maps.LatLngBounds(sw, ne))

  _mapElement: ->
    document.getElementById('map')

  _mapOptions: ->
    zoom: 13
    center: @_mapCenter()
    styles: @styleArray

  _mapCenter: ->
    new google.maps.LatLng(@location.get('latitude'), @location.get('longitude'))
