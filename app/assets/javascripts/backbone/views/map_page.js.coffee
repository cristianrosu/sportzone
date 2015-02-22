class Sportzone.Views.MapPage extends Backbone.View
  initialize: ({venues, sports, location, iconURL}) ->
    @venues = venues
    @sports = sports
    @location = location
    @iconURL = iconURL

    @listenTo(@venues, 'add', @_renderVenue)

  render: ->
    @mapView = new Sportzone.Views.Map(location: @location).render()
    @map = @mapView.map
    @searchFormView = new Sportzone.Views.SearchForm(collection: @venues, location: @location)

    @_renderAllVenues()
    this

  _renderAllVenues: ->
    @venues.each (model) =>
      @_renderVenue(model)

  _renderVenue: (model) ->
    markerView = new Sportzone.Views.Marker(model: model, map: @map, iconURL: @iconURL)
    listItemView = new Sportzone.Views.ListItem(model: model)

    $('#venues-list').append(listItemView.render().el)
    markerView.render()
