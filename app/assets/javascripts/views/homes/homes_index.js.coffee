class BackboneDemo.Views.HomesIndex extends Backbone.View

  template: JST['homes/index']

  render: ->
    $(@el).html(@template())
    this
