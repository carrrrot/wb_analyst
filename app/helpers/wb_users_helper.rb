module WbUsersHelper
	def wb_user_avatar(wb_id)
  	WbUser.where(wb_id: wb_id).first.profile_image_url unless wb_id.nil? || wb_id.empty?
  end

  def wb_user_competitors(wb_id)
  	WbUser.where(wb_id: wb_id).all
  end
end
