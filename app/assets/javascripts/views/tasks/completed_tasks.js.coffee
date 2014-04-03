class BackboneDemo.Views.CompletedTask extends Backbone.View

  template: JST['tasks/completed_task']

  tagName: 'li'

  events:
    'click .delete_task_link': 'deleteTask'
    'click .incomplete_task_link': 'makeTaskIncomplete'

  render: ->
    $(@el).html(@template(task: @model))
    this

  deleteTask: ->
    @.model.destroy()
    @.remove()

  makeTaskIncomplete: ->
    @.model.set('status',false)
    @.model.save()
    incomplete_task = new BackboneDemo.Views.IncompleteTask(model: @.model)
    $('#list-incomplete').prepend(incomplete_task.render().el)
    @.remove()