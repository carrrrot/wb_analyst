WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.ShowView extends Backbone.View
  template: JST["backbone/templates/wb_users/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
