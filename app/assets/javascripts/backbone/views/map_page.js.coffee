class Sportzone.Views.MapPage extends Backbone.View
  initialize: ({venues, sports, initLat, initLng, iconURL}) ->
    @venues = venues
    @sports = sports
    @initLat = initLat
    @initLng = initLng
    @iconURL = iconURL

    @listenTo(@venues, 'reset', @_renderAllVenues)

  render: ->
    @mapView = new Sportzone.Views.Map(lat: @initLat, lng: @initLng).render()
    @map = @mapView.map
    @searchFormView = new Sportzone.Views.SearchForm(collection: @venues)

    @_renderAllVenues()
    this

  _renderAllVenues: ->
    @venues.each (model) =>
      @_renderVenue(model, @map)

  _renderVenue: (model, map) ->
    markerView = new Sportzone.Views.Marker(model: model, map: map, iconURL: @iconURL)
    listItemView = new Sportzone.Views.ListItem(model: model)

    $('#venues-list').append(listItemView.render().el)
    markerView.render()
