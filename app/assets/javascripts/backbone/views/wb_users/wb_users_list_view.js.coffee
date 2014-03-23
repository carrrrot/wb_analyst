WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.WbUsersListView extends Backbone.View
  template: JST["backbone/templates/wb_users/wb_users_list"]

  initialize: () ->
    @options.list.bind('reset', @addAll)

  addAll: () =>
    @options.list.each(@addOne)

  addOne: (wb_user) =>
    view = new WbAnalyst.Views.WbUsers.WbUserView({model : wb_user})
    @$("ul").append(view.render().el)

  render: =>
    $(@el).html(@template(wb_users: @options.list.toJSON() ))
    @addAll()
    return this
