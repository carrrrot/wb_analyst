class WbAnalyst.Models.WbUser extends Backbone.RelationalModel
  # paramRoot: 'wb_user'
  urlRoot: '/wb_users'
  idAttribute: 'id'

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
    verified_type: null
    friends_count: null
    account_url: null

  relations: [
    type: Backbone.HasMany
    key: 'wb_user_frames'
    relatedModel: 'WbAnalyst.Models.WbUserFrame'
    # collectionType: 'WbAnalyst.Collections.WbUsersCollection'
    reverseRelation: 
        key: 'wb_user'
        includeInJSON: 'id' 
  ]


class WbAnalyst.Collections.WbUsersCollection extends Backbone.Collection
  model: WbAnalyst.Models.WbUser

  url: '/wb_users'

  verified: () ->
    @filter (wb_user) =>
        wb_user.get("verified_type") is 0
  
  starred: () ->
    @filter (wb_user) =>
        wb_user.get("verified_type") is 220

  unverified: () ->
    @filter (wb_user) =>
        wb_user.get("verified_type") is -1