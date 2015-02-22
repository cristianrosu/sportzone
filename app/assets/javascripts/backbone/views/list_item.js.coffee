class Sportzone.Views.ListItem extends Backbone.View
  template: HandlebarsTemplates['venues/list_item']

  events:
    'click .js-view-more' : 'toggleExpand'

  initialize: ({model}) ->
    @model = model

    # TODO: Think... is this necessary?
    # @listenTo(@model, 'change', @render)
    @listenTo(@model, 'remove', @remove)

  render: ->
    $(@el).html(@template(venue: @model.toJSON()))
    this

  toggleExpand: (e) ->
    @$('.js-venue-other-info').toggleClass('hidden')
    @$('.js-view-more i').toggleClass('glyphicon-menu-up text-primary')
