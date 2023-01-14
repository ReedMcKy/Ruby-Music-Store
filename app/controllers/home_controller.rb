class HomeController < ApplicationController
 
  def index
    response = HTTParty.get('http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists' + '&api_key=' + ENV['API_KEY'] + '&format=json')
    @response = JSON.parse(response.body)["artists"]["artist"]
  end

  def search
    term = params[:artist]
    @artists = HTTParty.get('http://ws.audioscrobbler.com/2.0/?method=artist.search&artist=' + term + '&api_key=' + ENV['API_KEY'] + '&format=json')
  end
  
  def profile
  end
end
