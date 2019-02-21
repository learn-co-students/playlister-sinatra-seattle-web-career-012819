class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      # Points to an integer that's in a foreign key
      t.references :artist
    end
  end
end
