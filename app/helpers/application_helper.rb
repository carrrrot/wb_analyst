module ApplicationHelper
	include HasAccessControl

	def check_login
    redirect_to login_url unless logged_in?
  end
end
