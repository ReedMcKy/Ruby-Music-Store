class SearchArtistController < ApplicationController
  def display
    if params[:art_name].present?
      artist_name = params[:art_name]
    else
      artist_name = 'Rick+Astley'
    end
    artist_search = HTTParty.get('https://api.napster.com/v2.2/search?apikey=' + ENV['API_KEY'] + '&query=' + artist_name + '&type=artist')
    artist_search = artist_search["search"]["data"]["artists"]
    @response = artist_search
  end
end
