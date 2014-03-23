class WbUsersController < ApplicationController
  include ApplicationHelper
  include WbUsersHelper
  include HasAccessControl

  before_filter :check_login

  def show
    @wb_user = WbUser.find(params[:id])
    respond_to { render json: @wb_user }
  end

  def index
    wb_user = WbUser.where(wb_id: session[:uid]).first
    @wb_users = wb_user.wb_competitors
    @wb_users.insert(0, wb_user)
  end

  def create
    pair = parse_user_url(params[:wb_user][:account_url])
    wb_id = pair["wb_id"]
    domain = pair["domain"]
    
    @wb_user = WbUser.where(wb_id: session[:uid]).first
    @wb_competitor = WbUser.where("wb_id = ? or lower(replace(domain, '.', '')) = replace(?, '.', '')", wb_id, domain).first

    @info = "success"
    if !@wb_competitor
      begin
        access_token = @wb_user.wb_access_token
        client = WeiboOAuth2::Client.new
        client.get_token_from_hash({:access_token => access_token.value, :expires_at => access_token.expires_at}) 
        # network issue !!!!!
        if wb_id 
          api_user = client.users.show_by_uid(wb_id)
          # body = RestClient.get 'https://api.weibo.com/2/users/show.json', {:params => {:access_token => access_token.value, :uid => wb_id}}
        elsif domain
          api_user = client.users.domain_show(domain)
          # body = RestClient.get 'https://api.weibo.com/2/users/domain_show.json', {:params => {:access_token => access_token.value, :domain => domain}}
        end
        # api_user = JSON(body)

        @wb_competitor = WbUser.new
        @wb_competitor.set_by_api(api_user)
        @wb_user.wb_competitors << @wb_competitor

        access_token.success_count += 1
      rescue
        # need to add the target_user to a job queue and retry in backgroud
        Rails.logger.error "#{Time.now} add_target_user error: #{$!}."
        access_token.error_count += 1
        @info = "error"
      ensure
        access_token.save!
      end # begin
    end # if

    respond_to do |format|
      if @info.eql? "success"
        format.json { render json: @wb_competitor, status: :created, location: @wb_competitor }
      else
        format.json { render json: @wb_competitor.errors, status: :unprocessable_entity }
      end
    end
  end # create
end
