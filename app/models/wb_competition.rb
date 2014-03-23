class WbCompetition < ActiveRecord::Base
  belongs_to :wb_user, :foreign_key => "wb_user_id", :class_name => "WbUser"
  belongs_to :wb_competitor, :foreign_key => "wb_competitor_id", :class_name => "WbUser" 
end
