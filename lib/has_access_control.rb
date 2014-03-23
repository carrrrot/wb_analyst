module HasAccessControl
  def logged_in?
    # binding.pry
    session[:uid] != nil
  end
end