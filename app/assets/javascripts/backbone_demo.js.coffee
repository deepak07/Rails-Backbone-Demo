window.BackboneDemo =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new BackboneDemo.Routers.Homes()
    Backbone.history.start()

$(document).ready ->
  BackboneDemo.initialize()
