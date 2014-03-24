WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.WbUsersFilterView extends Backbone.View
  template: JST["backbone/templates/wb_users/wb_users_filter"]

  render: =>
    $(@el).html(@template())
    return this
