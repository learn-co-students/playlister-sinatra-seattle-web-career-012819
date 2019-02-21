class CreateGenreSongs < ActiveRecord::Migration
  def change
    create_table :genre_songs do |column|
      column.integer :genre_id
      column.integer :song_id
    end
  end
end
