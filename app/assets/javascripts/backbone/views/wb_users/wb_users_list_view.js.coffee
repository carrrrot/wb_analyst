WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.WbUsersListView extends Backbone.View
  template: JST["backbone/templates/wb_users/wb_users_list"]

  initialize: () ->
    @options.list.bind('reset', @addAll)
    @options.list.bind('filter', @filterAll)

  addAll: () =>
    @options.list.each(@addOne)

  addOne: (wb_user) =>
    view = new WbAnalyst.Views.WbUsers.WbUserView({model : wb_user})
    @$("ul").append(view.render().el)

  filterOne: (wb_user) =>
    wb_user.trigger('visible')

  filterAll: () =>
    @options.list.each(@filterOne)

  render: ->
    verified = @options.list.verified().length

    $(@el).html(@template(wb_users: @options.list.toJSON() ))
    @addAll()
    @filterAll()
    return this
