class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug()
    self.name.gsub(/[!@#$%^&*]/, "-").gsub(" ", "-").downcase
  end

  def self.find_by_slug(string)
    #Song.find_by(name: string.gsub("-", " ").titleize)
    genres = Genre.all
    genres.find do |genre|
      genre.slug == string
    end
  end
end
