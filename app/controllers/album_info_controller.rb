class AlbumInfoController < ApplicationController
  def display
    @artist_name = params[:artist].gsub(/\s+/, "")
    @album_name = params[:album].gsub(/\s+/, "")
    response = HTTParty.get('http://ws.audioscrobbler.com/2.0/?method=album.getinfo'+'&api_key=' + ENV['API_KEY'] + '&artist='+ @artist_name + '&album=' + @album_name + '&format=json')
    @response = JSON.parse(response.body)
  end
end
