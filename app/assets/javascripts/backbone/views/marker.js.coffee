class Sportzone.Views.Marker extends Backbone.View
  initialize: ({model, map, iconURL}) ->
    @model = model
    @map = map
    @iconURL = iconURL

    # TODO: Think... is this necessary?
    # @listenTo(@model, 'sync', @render)
    @listenTo(@model, 'destroy', @remove)

  render: ->
    @_addMarker()
    this

  remove: ->
    @_removeMarker()
    super

  _addMarker: ->
    @marker = @_buildMarker(@model, @map)

  _removeMarker: ->
    if @marker
      google.maps.event.clearInstanceListeners(@marker)
      @marker.setMap(null)

  _buildMarker: (model, map) ->
    new google.maps.Marker
      position: @_buildPosition(model)
      map: map
      image: @iconURL
        size: new google.maps.Size(35, 55)
        url: @iconURL
        origin: new google.maps.Point(0,0)
        anchor: new google.maps.Point(0, 32)

  _buildPosition: (model) ->
    new google.maps.LatLng(
      model.get('latitude'),
      model.get('longitude')
    )
