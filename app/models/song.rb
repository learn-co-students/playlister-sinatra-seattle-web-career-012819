class Song < ActiveRecord::Base
  extend Slugable::ClassMethods
  include Slugable

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end

# remove special characters
# replace spaces with dashes
