class HomeController < ApplicationController
 
  def index
    response = HTTParty.get('http://api.napster.com/v2.2/artists/top' + '?apikey=' + ENV['API_KEY'] + '&limit=21')
    @response = JSON.parse(response.body)["artists"]
  end
  
  def profile
  end
end

