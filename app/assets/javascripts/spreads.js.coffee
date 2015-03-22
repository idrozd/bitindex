drawChart = ->

  materialChart = undefined
  materialDiv = document.getElementById('material')

  chart1 = window.spreadsData[0]

  # console.log(_(window.spreadsData[0].data).first 5)
  # data = google.visualization.arrayToDataTable(chart1.data)

  data = new google.visualization.DataTable()
  data.addColumn('datetime','Date')
  data.addColumn('number', chart1.key)
  data.addColumn('number', 'Spread')

  raw_data = _(chart1.data).map (row)-> [new Date(row[0] * 1000), row[1], row[2]]

  data.addRows raw_data



  materialOptions =
    theme: 'material'
    chart: title: chart1.key
    # curveType: 'function'
    lineWidth: 1
    width: 1200
    height: 500 # colors: ['black', 'white', 'orange', 'blue', 'red', 'green', 'grey']
    explorer: {axis: 'horizontal', maxZoomOut: 1, actions: ['dragToZoom', 'rightClickToReset']}
    hAxis:
      gridlines:
        count: 3
    vAxis:
      gridlines:
        count: 3
    vAxes:
      0: label: chart1.key
      1: label: 'Spread'
    series:
      0: targetAxisIndex: 0, color: 'black'
      1: targetAxisIndex: 1, color: 'lightgrey'

  materialChart = new google.visualization.LineChart(materialDiv)
  materialChart.draw data, materialOptions


google.load 'visualization', '1.1', packages: [
  'line'
  'corechart'
]
google.setOnLoadCallback drawChart



