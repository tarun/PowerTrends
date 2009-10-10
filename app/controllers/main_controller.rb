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
  
  def utility
  	url = 'http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20flickr.photos.search%20where%20has_geo%3D%22true%22%20and%20text%3D%22cape%20cod%22&format=json&diagnostics=false&callback='
    resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body
    result = JSON.parse(data)
    #@point = data
    @images = []
     result['query']['results']['photo'].each { |l|
    
    	@images << 'http://farm' + l['farm'] + '.static.flickr.com/' + l['server'] + '/' + l['id'] + '_' + l['secret'] + '_s.jpg'
    
    }
    
	#tv listings
	@tv_listings = get_tv_listings
    
    # upcoming
    url = 'http://upcoming.yahooapis.com/services/rest/?method=event.search&api_key=1bb666b1b0&location=Cape%20Cod,MA&radius=50&min_date=2009-10-12&max_date=2009-10-20&format=json'
   resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body
    result = JSON.parse(data)
    @events = result['rsp']['event']
    
    
  
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
  
def twitter_viz
    date = Time.now.strftime("%Y-%m-%d").to_s
    loc = 55
    url = "http://comminfo.rutgers.edu/~hsbakshi/freq.php?loc=#{loc}&date=#{date}"
    
    resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body
   
    render :inline => data
  end  

  def get_tv_listings
    cur_time = Time.now
    
    url = "http://www.tvguide.com/listings/data/ajaxcache.ashx?fmt=0&srvid=80001&gridmins=60&gridyr=#{cur_time.year}&gridmo=#{cur_time.month}&griddy=#{cur_time.day}&gridhr=13&chanrow=1&genre=0&favchan=false"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body

    listings = data.gsub(/\d+\s/,'|').squeeze('|').split('magic=|')[1].split('|')    
    listings = listings.each_index{|x| (x%2 != 0)?listings[x]:nil}.compact.uniq

    tv_shows = Hash.new
#    min_score=0.0
#    max_score=0.0
#    cur_score=0.0

    listings.slice(1,20).each { |show|
 #     cur_score = get_popularity(show).to_i
 #     max_score = cur_score if(cur_score > max_score)
#			min_score = cur_score if(cur_score < min_score)
      tv_shows[show.strip]=rand(4)#cur_score
    }

#    updated_tv_shows = Hash.new

#    factor = (max_score - min_score) / 10;
#    tv_shows.each_pair {|key, value| updated_tv_shows[key.strip] = (((value-min_score)/factor)) }
          
#  updated_tv_shows

    tv_shows
  
end

def get_popularity(term)
    BOSSMan.application_id = "a3mfZ2zV34HH4W8CuMagSfKAgCnhjFNobFvUgy9SnQlfX00OWbVMMm_HfuS9"
    boss = BOSSMan::Search.web(term, { :count => 1, :filter => "-hate" })
    boss.totalhits
end
end