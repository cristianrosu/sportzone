class Sportzone.Views.SearchForm extends Backbone.View
  el: '#search-form'

  events:
    'ajax:complete' : 'ajaxComplete'

  initialize: ({collection}) ->
    @collection = collection

  ajaxComplete: (event, jqxhr, settings, exception) ->
    switch jqxhr.status
      when 200
        response = JSON.parse(jqxhr.responseText)
        @collection.remove(@collection.models) # Remove all venues
        @collection.reset(response.venues)
