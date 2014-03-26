WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.FrameView extends Backbone.View
  template: JST["backbone/templates/wb_users/frame"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
