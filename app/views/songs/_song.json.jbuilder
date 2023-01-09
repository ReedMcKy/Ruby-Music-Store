json.extract! song, :id, :song_title, :album_title, :artist_name, :created_at, :updated_at
json.url song_url(song, format: :json)
