class MainController < ApplicationController
  layout 'main'
  
  def index
  end

  def get_weather
    zipcode = params[:zipcode]
    url = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20location%3D#{zipcode}&format=json&diagnostics=false&callback="
    resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body

   # we convert the returned JSON data to native Ruby
   # data structure - a hash
   result = JSON.parse(data)

   weather = result['query']['results']['channel']['item']['description']

    render :inline => weather
  end

end
