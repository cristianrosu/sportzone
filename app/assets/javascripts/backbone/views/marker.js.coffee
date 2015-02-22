class Sportzone.Views.Marker extends Backbone.View
  initialize: ({model, map}) ->
    @model = model
    @map = map

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

  _buildPosition: (model) ->
    new google.maps.LatLng(
      model.get('latitude'),
      model.get('longitude')
    )
