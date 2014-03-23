WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.ShowView extends Backbone.View
  template: JST["backbone/templates/wb_users/show"]

  render: ->
    # $(@el).html(@template(@model.toJSON() ))
    # return this
    view = new WbAnalyst.Views.WbUsers.WbUsersListView({list : @options.wb_users})
    $(@el).html(@template(@model.toJSON()))
    @$(".span3").append(view.render().el)

    return this
