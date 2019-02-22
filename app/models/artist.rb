class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug()
    self.name.gsub(/[!@#$%^&*]/, "-").gsub(" ", "-").downcase
  end

  def self.find_by_slug(string)
    #Song.find_by(name: string.gsub("-", " ").titleize)
    artists = Artist.all
    artists.find do |artist|
      artist.slug == string
    end
  end

end
