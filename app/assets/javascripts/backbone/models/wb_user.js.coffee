class WbAnalyst.Models.WbUser extends Backbone.Model
  paramRoot: 'wb_user'

  defaults:
  	wb_id: null
  	screen_name: null
  	name: null
  	province: null
  	city: null
  	location: null
  	description: null
  	url: null
  	profile_image_url: null
  	domain: null
  	gender: null
  	followers_count: null
  	statuses_count: null
  	favourites_count: null
  	joined_at: null
  	verified: null
  	avatar_large: null
  	verified_reason: null
  	bi_followers_count: null
  	lang: null

  url: '/wb_user'