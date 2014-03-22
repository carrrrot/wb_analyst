class WbUsersController < ApplicationController
	include ApplicationHelper
  include HasAccessControl

  before_filter :check_login

	def show
		@wb_user = WbUser.new
		@wb_user.name = "Test"
	end

	def index
		wb_user1 = WbUser.new
		wb_user1.id = 1
		wb_user1.name = "Test1"

		wb_user2 = WbUser.new
		wb_user2.id = 2
		wb_user2.name = "Test2"

		@wb_users = Array.new
		@wb_users[0] = wb_user1
		@wb_users[1] = wb_user2
	end
end
