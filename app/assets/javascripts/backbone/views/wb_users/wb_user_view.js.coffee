WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.WbUserView extends Backbone.View
  template: JST["backbone/templates/wb_users/wb_user"]

  # events:
  #   "click .destroy" : "destroy"

  tagName: "li"

  # destroy: () ->
  #   @model.destroy()
  #   this.remove()

  #   return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
