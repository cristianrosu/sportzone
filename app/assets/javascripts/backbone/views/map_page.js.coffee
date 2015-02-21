class Sportzone.Views.MapPage extends Backbone.View
  initialize: ({venues}) ->
    @venues = venues

  render: ->
    @mapView = new Sportzone.Views.Map().render()
