class Sportzone.Views.MapPage extends Backbone.View
  initialize: ({venues, sports, initLat, initLng, iconURL}) ->
    @venues = venues
    @sports = sports
    @initLat = initLat
    @initLng = initLng
    @iconURL = iconURL

  render: ->
    @mapView = new Sportzone.Views.Map(lat: @initLat, lng: @initLng).render()
    @map = @mapView.map

    @_renderAllVenues(@map)
    this

  _renderAllVenues: (map) ->
    @venues.each (model) =>
      @_renderVenue(model, map)

  _renderVenue: (model, map) ->
    markerView = new Sportzone.Views.Marker(model: model, map: map, iconURL: @iconURL)
    listItemView = new Sportzone.Views.ListItem(model: model)

    $('#venues-list').append(listItemView.render().el)
    markerView.render()
