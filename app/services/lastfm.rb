module Lastfm
    class Search
        def self.by_artist(artist)
            Faraday.get 'http://ws.audioscrobbler.com/2.0?method=artist.search&artist=' + artist + '&api_key=' + ENV['API_KEY'] + '&format=json'
        end
    end
end