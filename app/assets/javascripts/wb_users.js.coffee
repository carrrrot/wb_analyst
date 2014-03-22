# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  window.router = new WbAnalyst.Routers.WbUsersRouter(wb_users: $('#wb_users').data('wb_users'))
  Backbone.history.start()
  return