class WbAnalyst.Routers.WbUsersRouter extends Backbone.Router
  # initialize: (options) ->
  # 	@wb_user = new WbAnalyst.Models.WbUser(options.wb_user)
  initialize: (options) ->
    @wb_users = new WbAnalyst.Collections.WbUsersCollection()
    @wb_users.reset options.wb_users

  routes:
  	"index"     : "index"
  	":id"       : "show"
  	".*"        : "index"
  
  # show: ->
  # 	@view = new WbAnalyst.Views.WbUsers.ShowView(model: @wb_user)
  # 	$("#wb_user").html(@view.render().el)
  index: ->
    @view = new WbAnalyst.Views.WbUsers.IndexView(wb_users: @wb_users)
    $("#wb_users").html(@view.render().el)

  show: (id) ->
    wb_user = @wb_users.get(id)

    @view = new WbAnalyst.Views.WbUsers.ShowView(wb_users: @wb_users, model: wb_user)
    $("#wb_users").html(@view.render().el)