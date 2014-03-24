WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.NewView extends Backbone.View
  template: JST["backbone/templates/wb_users/new"]

  events:
    "submit #new-wb_user": "save"

  constructor: (options) ->
    super(options)
    @model = new @options.wb_users.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @options.wb_users.create(@model.toJSON(),
      success: (wb_user) =>
        @model = wb_user
        window.location.hash = "/#/wb/{@model.id}"

      error: (wb_user, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    listView = new WbAnalyst.Views.WbUsers.WbUsersListView({list : @options.wb_users})
    filterView = new WbAnalyst.Views.WbUsers.WbUsersFilterView({})

    $(@el).html(@template(@model.toJSON() ))
    @$(".span3").append(filterView.render().el)
    @$(".span3").append(listView.render().el)

    this.$("form").backboneLink(@model)

    return this
