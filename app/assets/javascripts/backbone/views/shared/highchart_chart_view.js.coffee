WbAnalyst.Views.Shared ||= {}

class WbAnalyst.Views.Shared.ChartView extends Backbone.View

  initialize: (options) ->
    @data = options.data
    return

  render: ->
    $(@el).highcharts
      title:
        text: ""

      xAxis:
        type: 'datetime'

      yAxis:
        title:
          text: ""

      tooltip:
        xDateFormat: '%m-%d %H:%M:%S'

      legend:
        layout: "vertical"
        align: "right"
        verticalAlign: "middle"
        borderWidth: 0

      series: @data.toJSON()

    return this