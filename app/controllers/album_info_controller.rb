class AlbumInfoController < ApplicationController
  def display
    @album_id = params[:id]
    @album = params[:album]
    @art_name = params[:artist]
    tracks_arr = []

    tracks = HTTParty.get('http://api.napster.com/v2.2/albums/'+ @album_id +'/tracks?apikey='+ ENV["API_KEY"])
    if !tracks.nil?
      tracks = tracks["tracks"]
      tracks.each do |song|
          tracks_arr.push(song["name"])
      end
    end
    @response = tracks_arr

  end
  
end
