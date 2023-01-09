class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :song_title
      t.string :album_title
      t.string :artist_name

      t.timestamps
    end
  end
end
