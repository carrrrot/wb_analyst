WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.ShowView extends Backbone.View
  template: JST["backbone/templates/wb_users/show"]

  handleWbUserFrame: (frame) => 
    @frame_fo_data_array.push [Date.parse(frame.attributes.created_at), frame.attributes.followers_per_hour]
    @frame_bifo_data_array.push [Date.parse(frame.attributes.created_at), frame.attributes.bi_followers_per_hour]
    @frame_fri_data_array.push [Date.parse(frame.attributes.created_at), frame.attributes.friends_per_hour]
    @frame_sta_data_array.push [Date.parse(frame.attributes.created_at), frame.attributes.statuses_per_hour]
    @frame_fav_data_array.push [Date.parse(frame.attributes.created_at), frame.attributes.favourites_per_hour]

  render: ->
    listView = new WbAnalyst.Views.WbUsers.WbUsersListView({collection : @collection})
    filterView = new WbAnalyst.Views.WbUsers.WbUsersFilterView({})

    @frame_fo_data_array = new Array
    @frame_bifo_data_array = new Array
    @frame_fri_data_array = new Array
    @frame_sta_data_array = new Array
    @frame_fav_data_array = new Array

    @handleWbUserFrame frame for frame in @model.attributes.wb_user_frames.models

    items = new WbAnalyst.Collections.Series([
      {
        name: "followers_per_hour"
        data: @frame_fo_data_array
        pointInterval: 60 * 1000 * 60
      }
      {
        name: "bi_followers_per_hour"
        data: @frame_bifo_data_array
        pointInterval: 60 * 1000 * 60
      }
      {
        name: "friends_per_hour"
        data: @frame_fri_data_array
        pointInterval: 60 * 1000 * 60
      }
      {
        name: "statuses_per_hour"
        data: @frame_sta_data_array
        pointInterval: 60 * 1000 * 60
      }
      {
        name: "favourites_per_hour"
        data: @frame_fav_data_array
        pointInterval: 60 * 1000 * 60
      }
    ])

    chartView = new WbAnalyst.Views.Shared.ChartView({ data: items })

    $(@el).html(@template(@model.toJSON()))
    @$(".span3").append(filterView.render().el)
    @$(".span3").append(listView.render().el)

    @$("#metrics_count_chart").append(chartView.render().el)

    return this
