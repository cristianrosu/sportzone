class Sportzone.Views.MapPage extends Backbone.View
  initialize: ({venues}) ->
    @venues = venues

  render: ->
    @mapView = new Sportzone.Views.Map().render()
    @map = @mapView.map

    @_renderAllVenues(@map)
    this

  _renderAllVenues: (map) ->
    @venues.each (model) =>
      @_renderVenue(model, map)

  _renderVenue: (model, map) ->
    markerView = new Sportzone.Views.Marker(model: model, map: map).render()
