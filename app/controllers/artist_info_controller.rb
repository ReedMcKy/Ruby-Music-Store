class ArtistInfoController < ApplicationController
  def display
    @art_id = params[:art_id]
    @art_name = params[:name]

    albums_arr = []
    albums = HTTParty.get('http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist='+ @art_name +'&api_key=' + ENV['FM_KEY'] + '&format=json')
    albums = albums["topalbums"]["album"]
    albums.each do |album|
      albums_arr.push(album["name"])
    end

    album_search_id_arr = []
    albums_arr.slice(0,8).each do |title|
      if title.ascii_only? && !title.include?("#")
        puts 'https://api.napster.com/v2.2/search?apikey=' + ENV['API_KEY'] + '&query=' + title + '&type=album'
        album_search = HTTParty.get('https://api.napster.com/v2.2/search?apikey=' + ENV['API_KEY'] + '&query=' + title + '&type=album')
      end
      if !album_search.nil?
        if !album_search["search"]["data"]["albums"].empty? && !album_search["search"]["data"].empty? && !album_search["search"].empty?
          album_search_id_arr.push(album_search["search"]["data"]["albums"][0]["id"])
        end
      end
    end  

    album_name_arr = []
    album_img_arr = []
    album_search_id_arr.each do |id|
      album_img_search = 'https://api.napster.com/imageserver/v2/albums/'+ id +'/images/300x300.jpg'
      album_img_arr.push(album_img_search)
      album_name_search = HTTParty.get('https://api.napster.com/v2.2/albums/'+ id +'?apikey=' + ENV['API_KEY'])
      album_name_arr.push(album_name_search["albums"][0]["name"])
    end
    @images = album_img_arr
    @titles = album_name_arr 

  end
end
