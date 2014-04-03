class BackboneDemo.Views.IncompleteTask extends Backbone.View

  template: JST['tasks/incomplete_task']

  tagName: 'li'

  events:
    'change .task-completed-box': 'eventCompleted'

  render: ->
    $(@el).html(@template(task: @model))
    this

  eventCompleted: ->
    @.model.set('status', true)
    @.model.save()
    completed_task = new BackboneDemo.Views.CompletedTask(model: @.model)
    $('#list-completed').prepend(completed_task.render().el)
    @.remove()
