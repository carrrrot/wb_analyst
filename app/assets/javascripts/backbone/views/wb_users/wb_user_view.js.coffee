WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.WbUserView extends Backbone.View
  template: JST["backbone/templates/wb_users/wb_user"]

  events:
    "click .destroy" : "destroy"

  tagName: "li"

  initialize: () ->
    @model.bind('visible', @toggleVisible)

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  toggleVisible: () =>
    $(@el).toggleClass("hidden", @isHidden())

  isHidden: () ->
    verified_type = @model.get("verified_type")
    ( not (verified_type is 0 or verified_type is 2) && (WbAnalyst.WbUserFilter is "verified")) || ( not (verified_type is 220) && (WbAnalyst.WbUserFilter is "starred")) || ( not (verified_type is -1) && (WbAnalyst.WbUserFilter is "unverified"))

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
