class WbAnalyst.Routers.LoginsRouter extends Backbone.Router

	routes:
		".*"        : "login"

	login: ->
    @view = new WbAnalyst.Views.Logins.LoginView()
    $("#login_info").html(@view.render().el)