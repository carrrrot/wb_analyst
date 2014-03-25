WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.ShowView extends Backbone.View
  template: JST["backbone/templates/wb_users/show"]

  render: ->
    listView = new WbAnalyst.Views.WbUsers.WbUsersListView({collection : @collection})
    filterView = new WbAnalyst.Views.WbUsers.WbUsersFilterView({})

    $(@el).html(@template(@model.toJSON()))
    @$(".span3").append(filterView.render().el)
    @$(".span3").append(listView.render().el)

    return this
