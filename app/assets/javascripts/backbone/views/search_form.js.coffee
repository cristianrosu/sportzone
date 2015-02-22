class Sportzone.Views.SearchForm extends Backbone.View
  el: '#search-form'

  events:
    'ajax:complete' : 'ajaxComplete'

  initialize: ({collection, location}) ->
    @collection = collection
    @location = location

  ajaxComplete: (event, jqxhr, settings, exception) ->
    switch jqxhr.status
      when 200
        response = JSON.parse(jqxhr.responseText)
        # Update new map center
        @location.set(response.location)
        # Perform a "smart" update of venues collection
        @collection.set(response.venues)
