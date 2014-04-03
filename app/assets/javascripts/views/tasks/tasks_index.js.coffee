class BackboneDemo.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']

  events:
    'submit #taskAdd': 'submitTask'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendIncompleteTasks, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendIncompleteTasks)
    @collection.each(@appendCompletedTasks)
    $('[data-behaviour~=datepicker]').datepicker({dateFormat: 'dd-mm-yyyy',format: 'dd-mm-yyyy' })
    this

  submitTask: (event) ->
    event.preventDefault()
    task_attributes =
      title: $('#task-title').val()
      description: $('#task-description').val()
      due_date: $('#task-due').val()
      status: false
    @collection.create task_attributes,
      wait: true
      success: ->
        $('#taskAdd')[0].reset()
      error: @handleCreateError

  handleCreateError: (task, response) ->
    error_messages = $.parseJSON(response.responseText)
    for attibute, messages of error_messages
      alert "#{attibute} #{message}" for message in messages

  appendIncompleteTasks: (task) ->
    if task.get('status') == false
      incomplete_task = new BackboneDemo.Views.IncompleteTask(model: task)
      $('#list-incomplete').prepend(incomplete_task.render().el)

  appendCompletedTasks: (task) ->
    if task.get('status') == true
      completed_task = new BackboneDemo.Views.CompletedTask(model: task)
      $('#list-completed').prepend(completed_task.render().el)