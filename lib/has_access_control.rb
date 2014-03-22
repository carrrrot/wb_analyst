module HasAccessControl
  def logged_in?
  	# binding.pry
    cookies[:uid] != nil
  end
end