class WbAnalyst.Routers.WbUsersRouter extends Backbone.Router
  initialize: (options) ->
  	@wb_user = new WbAnalyst.Models.WbUser(options.wb_user)

  routes:
  	".*"        : "show"
  
  show: ->
  	@view = new WbAnalyst.Views.WbUsers.ShowView(model: @wb_user)
  	$("#wb_user").html(@view.render().el)