module Fetch
  include ApplicationHelper

  def self.fetch_target_users(access_token, target_users)
    client = WeiboOAuth2::Client.new
    client.get_token_from_hash({:access_token => access_token.value, :expires_at => access_token.expires_at}) 
    target_users.each do |target_user|
      begin
        api_user = client.users.show_by_uid(target_user.wb_id)
        target_user.set_by_api(api_user)

        if (target_user.wb_user_frames.where("created_at >= ?", Time.now.utc - 1.hour).empty?)
          target_user.wb_user_frames.create(followers_count: api_user["followers_count"], 
            bi_followers_count: api_user["bi_followers_count"],
            friends_count: api_user["friends_count"],
            statuses_count: api_user["statuses_count"],
            favourites_count: api_user["favourites_count"])
        end
        target_user.save!
        access_token.success_count += 1
      rescue
        access_token.error_count += 1
      ensure
        access_token.save!
      end
    end
  end

  def fetch_wb_users(wb_users)
    wb_users.each do |wb_user|
      access_token = wb_user.wb_access_token
      target_users = wb_user.wb_competitors
      target_users.insert(-1, WbUser.find(wb_user.id))
      Fetch.fetch_target_users(access_token, target_users)
    end
  end
end