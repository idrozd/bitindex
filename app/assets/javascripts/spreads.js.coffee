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

  data.addRows _(raw_data).first(30)



  materialOptions =
    chart: title: chart1.key
    curveType: 'function'
    lineWidth: 10
    width: 1200
    height: 500 # colors: ['black', 'white', 'orange', 'blue', 'red', 'green', 'grey']
    explorer: {}
    axes:
      x:
        date: label: 'xueybl'
      y:
        "#{chart1.key}": label: chart1.key, baselineColor: 'black', title: 'WHOHOHA'
        spread: label: 'Spread', gridlines: count: 40
    series:
      0: color: '#e7711b', axis: "#{chart1.key}", pointColor: 'orange', color: 'orange'
      1: axis: 'spread', color: 'black', pointSize: 20

  materialChart = new google.charts.Line(materialDiv)
  materialChart.draw data, materialOptions


google.load 'visualization', '1.1', packages: [
  'line'
  'corechart'
]
google.setOnLoadCallback drawChart



