module ApplicationHelper
  include HasAccessControl

  WeiboOAuth2::Config.api_key = API_KEY
  WeiboOAuth2::Config.api_secret = API_SECRET
  WeiboOAuth2::Config.redirect_uri = REDIRECT_URI

  def check_login
    redirect_to login_url unless logged_in?
  end
end
