WbAnalyst.Views.WbUsers ||= {}

class WbAnalyst.Views.WbUsers.ShowView extends Backbone.View
  template: JST["backbone/templates/wb_users/show"]

  handleWbUserFrame: (frame) => 
  	data = [Date.parse(frame.attributes.created_at), frame.attributes.followers_per_hour]
  	@frame_data_array.push data

  render: ->
    listView = new WbAnalyst.Views.WbUsers.WbUsersListView({collection : @collection})
    filterView = new WbAnalyst.Views.WbUsers.WbUsersFilterView({})

    @frame_data_array = new Array
    @handleWbUserFrame frame for frame in @model.attributes.wb_user_frames.models

    items = new WbAnalyst.Collections.Series([
      {
        name: "followers_per_hour"
        data: @frame_data_array
        pointInterval: 60 * 1000 * 60
      }
    ])

    chartView = new WbAnalyst.Views.Shared.ChartView({ data: items })

    $(@el).html(@template(@model.toJSON()))
    @$(".span3").append(filterView.render().el)
    @$(".span3").append(listView.render().el)

    @$("#metrics_count_chart").append(chartView.render().el)

    return this
