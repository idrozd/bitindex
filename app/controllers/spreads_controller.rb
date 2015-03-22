class SpreadsController < ApplicationController
  layout 'spreads'

  def index
# https://blockchain.info/charts/total-bitcoins?showDataPoints=false&timespan=all&show_header=true&daysAverageString=1&scale=0&format=json&address=

    @data = ['market-cap'].map do |chart_name|
      original_data = JSON.load( HTTParty.get(
        "https://blockchain.info/charts/#{chart_name}?format=json").body)['values'].
        map{|point| point.values_at('x','y')}

      spread = Calculations.spread(original_data)
      two_y_axes = Calculations.zip_serieses_by_abscissa(original_data, spread)

      {
        key: chart_name,
        data: two_y_axes #.unshift(['Date', chart_name, 'Spread' ])
      }
    end
  end


end
