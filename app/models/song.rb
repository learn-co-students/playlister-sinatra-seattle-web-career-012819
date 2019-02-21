class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :genres, through: :song_genres
    has_many :song_genres

    def slug
        self.name.downcase.split(' ').join('-')
    end

    def self.find_by_slug(slug)
        original_name = slug.titleize
        self.all.find do |song|
            song.name == original_name
        end
    end
end