class MainController < ApplicationController
  layout 'main'
  
  def index
  
  
  	@cities=Hash.new
	@cities[1]='Bourne'
	@cities[2]='Brewster'
	@cities[3]='Cape Cod'
	@cities[4]='Cataumet'
	@cities[5]='Centerville'
	@cities[6]='Cotuit'
	@cities[7]='Dennis Port'
	@cities[8]='Dennisport'
	@cities[9]='E. Falmouth'
	@cities[10]='East Falmouth'
	@cities[11]='East Orleans'
	@cities[12]='East Sandwich'
	@cities[13]='Eastham'
	@cities[14]='Edgartown'
	@cities[15]='Falmouth'
	@cities[16]='Forestdale'
	@cities[17]='Harwich'
	@cities[18]='Harwich Port'
	@cities[19]='Hyannis'
	@cities[20]='Marstons Mills'
	@cities[21]='Mashpee'
	@cities[22]='Monument Beach'
	@cities[23]='North Falmouth'
	@cities[24]='North Truro'
	@cities[25]='Oak Bluffs'
	@cities[26]='Osterville'
	@cities[27]='Sandiwch'
	@cities[28]='Sandwich'
	@cities[29]='South Dennis'
	@cities[30]='South Orleans'
	@cities[31]='Truro'
	@cities[32]='Vineyard Haven'
	@cities[33]='Wellfleet'
	@cities[34]='West Chatham'
	@cities[35]='West Dennis'
	@cities[36]='West Tisbury'
	@cities[37]='West Yarmouth'
	@cities[38]='Yarmouth Port'
	
	@cities = @cities.sort { |a,b| a[1] <=> b[1] }
  
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
