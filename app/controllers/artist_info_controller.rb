class ArtistInfoController < ApplicationController
  def display
    @result = params[:name]
    response = HTTParty.get('http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist='+ @result + '&api_key=' + ENV['API_KEY'] + '&format=json')
    @response = JSON.parse(response.body)["topalbums"]["album"]
  end
end
