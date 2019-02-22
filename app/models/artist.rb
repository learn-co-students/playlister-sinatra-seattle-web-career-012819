class Artist < ActiveRecord::Base
  has_many :songs 
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres
   
  def slug
    self.name.gsub(" ", '-').downcase
  end

  def self.find_by_slug(slug)
    song = self.all.find do |song|
      song.slug == slug
    end
  end
end