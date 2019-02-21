class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug 
    Slugifiable.slug(self.name)
  end

  def self.find_by_slug(slug)
    name = slug.Titleize
    Artist.find(name: name)
  end


end
