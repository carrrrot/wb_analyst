WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.IndexView extends Backbone.View
  template: JST["backbone/templates/wb_users/index"]

  # initialize: () ->
  #   @options.wb_users.bind('reset', @addAll)

  # addAll: () =>
  #   @options.wb_users.each(@addOne)

  # addOne: (wb_user) =>
  #   view = new WbAnalyst.Views.WbUsers.WbUserView({model : wb_user})
  #   # @$("tbody").append(view.render().el)
  #   @$("ul").append(view.render().el)

  render: =>
    listView = new WbAnalyst.Views.WbUsers.WbUsersListView({list : @options.wb_users})
    filterView = new WbAnalyst.Views.WbUsers.WbUsersFilterView({})

    $(@el).html(@template())
    @$(".span3").append(filterView.render().el)
    @$(".span3").append(listView.render().el)

    return this
