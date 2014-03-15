class WbUsersController < ApplicationController

	def show
		@wb_user = WbUser.new
		@wb_user.name = "Test"
	end
end
