module Slugify
  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(str)
    self.all.find_by { |item| item.slug == str }
  end
end