class LoginsController < ApplicationController
  include HasAccessControl

  WeiboOAuth2::Config.api_key = API_KEY
  WeiboOAuth2::Config.api_secret = API_SECRET
  WeiboOAuth2::Config.redirect_uri = REDIRECT_URI

  def show
  end

  def connect
    client = WeiboOAuth2::Client.new
    redirect_to client.authorize_url
  end

  def callback
    client = WeiboOAuth2::Client.new
    access_token = client.auth_code.get_token(params[:code].to_s)
    wb_id = session[:uid] = access_token.params["uid"]
    # cookies[:uid] = wb_id
    token_value = session[:access_token] = access_token.token
    expires_at = session[:expires_at] = access_token.expires_at
    begin
      user = client.users.show_by_uid(session[:uid].to_i)
      # binding.pry
      @wb_user = WbUser.where(wb_id: wb_id).first_or_initialize
      @wb_user.set_by_api user

      @wb_user.build_wb_access_token(value: token_value, expires_at: expires_at)
      @wb_user.save!
    rescue
      Rails.logger.error "#{Time.now} get_token error: #{$!}."
    end

    redirect_to wb_users_url
  end

  def logout
  	reset_session
  	redirect_to login_url
  end
end
