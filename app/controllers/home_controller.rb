class HomeController < ApplicationController
 
  def index
    response = HTTParty.get('http://api.napster.com/v2.2/artists/top' + '?apikey=' + ENV['API_KEY'] + '&limit=15')
    @response = JSON.parse(response.body)["artists"]
  end

  def search
    term = params[:artist]
    @artists = HTTParty.get('http://ws.audioscrobbler.com/2.0/?method=artist.search&artist=' + term + '&api_key=' + ENV['API_KEY'] + '&format=json')
  end
  
  def profile
  end
end

