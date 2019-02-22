class Artist < ActiveRecord::Base
  extend Slugable::ClassMethods
  include Slugable

  has_many :songs
  has_many :genres, through: :songs
end
