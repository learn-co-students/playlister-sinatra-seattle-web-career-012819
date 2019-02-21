class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :genre_songs
end
