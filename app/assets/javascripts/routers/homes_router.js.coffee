class BackboneDemo.Routers.Homes extends Backbone.Router

  routes:
    '': 'index'

  initialize: ->
    @tasks = new BackboneDemo.Collections.Tasks()
    @tasks.fetch({reset :true})

  index: ->
    home_view = new BackboneDemo.Views.HomesIndex()
    task_list = new BackboneDemo.Views.TasksIndex(collection: @tasks)
    $('#task-container-title').html(home_view.render().el)
    $('#task_container').html(task_list.render().el)