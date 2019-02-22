class Song <ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

 def slug
    Slugifiable.slug(self.name)
  end

  def self.find_by_slug(slug)
    Song.all.find do |song|
      slug == song.slug 
    end
  end



end
