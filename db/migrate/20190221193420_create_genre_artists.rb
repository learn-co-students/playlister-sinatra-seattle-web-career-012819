class CreateGenreArtists < ActiveRecord::Migration
  def change
    create_table :genre_artists do |column|
      column.integer :genre_id
      column.integer :artist_id
    end
  end
end
