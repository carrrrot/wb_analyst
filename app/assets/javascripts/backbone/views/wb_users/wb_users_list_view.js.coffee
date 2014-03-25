WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.WbUsersListView extends Backbone.View
  template: JST["backbone/templates/wb_users/wb_users_list"]

  initialize: () ->
    @collection.bind('reset', @addAll)
    @collection.bind('filter', @filterAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (wb_user) =>
    view = new WbAnalyst.Views.WbUsers.WbUserView({model : wb_user})
    @$("ul").append(view.render().el)

  filterOne: (wb_user) =>
    wb_user.trigger('visible')

  filterAll: () =>
    @collection.each(@filterOne)

  render: ->
    verified = @collection.verified().length

    $(@el).html(@template(wb_users: @collection.toJSON() ))
    @addAll()
    @filterAll()
    return this
