class WbUserFrame < ActiveRecord::Base
  belongs_to :wb_user
  attr_accessible :followers_count, :bi_followers_count, :friends_count, :statuses_count, :favourites_count, :followers_per_hour, :bi_followers_per_hour, :friends_per_hour, :statuses_per_hour, :favourites_per_hour
end
