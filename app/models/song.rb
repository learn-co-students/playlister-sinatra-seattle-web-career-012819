class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    new_name = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def find_by_slug(slug)
    slug
    Song.find_by(name:)
  end
end

# remove special characters
# replace spaces with dashes
