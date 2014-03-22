WbAnalyst.Views.Logins ||= {}

class WbAnalyst.Views.Logins.LoginView extends Backbone.View
  template: JST["backbone/templates/logins/login"]

  render: ->
    $(@el).html(@template())
    return this