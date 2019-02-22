class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug()
    if self.name
      self.name.gsub(/[!@#$%^&*]/, "-").gsub(" ", "-").downcase
    end
  end

  def self.find_by_slug(string)
    #Song.find_by(name: string.gsub("-", " ").titleize)
    songs = Song.all
    songs.find do |song|
      song.slug == string
    end
  end
end
