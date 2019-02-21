require 'pry'

class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        slugged_name = self.name.downcase.split(' ').join('-')
    end

    def self.find_by_slug(slug)
        original_name = slug.titleize
        self.all.find do |artist|
            artist.name == original_name
        end
    end
end