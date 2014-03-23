class WbUser < ActiveRecord::Base
  has_one :wb_access_token, dependent: :destroy
  accepts_nested_attributes_for :wb_access_token

  has_and_belongs_to_many :wb_competitors, :class_name => "WbUser",
    :join_table => "wb_competitions",
    :foreign_key => "wb_user_id",
    :association_foreign_key => "wb_competitor_id"

  def set_by_api(user)
    self.wb_id = user.id
    self.screen_name = user.screen_name
    self.name = user.name
    self.province = user.province
    self.city = user.city
    self.location = user.location
    self.description = user.description
    self.url = user.url
    self.profile_image_url = user.profile_image_url
    self.domain = user.domain
    self.gender = user.gender
    self.followers_count = user.followers_count
    self.friends_count = user.friends_count
    self.statuses_count = user.statuses_count
    self.favourites_count = user.favourites_count
    self.joined_at = user.created_at
    self.verified = user.verified
    self.verified_type = user.verified_type
    self.avatar_large = user.avatar_large
    self.verified_reason = user.verified_reason
    self.bi_followers_count = user.bi_followers_count
    self.lang = user.lang
  end
end
