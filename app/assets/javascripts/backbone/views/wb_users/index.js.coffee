WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.IndexView extends Backbone.View
  template: JST["backbone/templates/wb_users/index"]

  initialize: () ->
    @options.wb_users.bind('reset', @addAll)

  addAll: () =>
    @options.wb_users.each(@addOne)

  addOne: (wb_user) =>
    view = new WbAnalyst.Views.WbUsers.WbUserView({model : wb_user})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(wb_users: @options.wb_users.toJSON() ))
    @addAll()

    return this
