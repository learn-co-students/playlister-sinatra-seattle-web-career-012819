class Slugifiable

  #removes spaces replaces them with dashes
  #also special characters
  def self.slug(name)
    name.gsub(/[!@#$%^&*]/, "-").gsub(" ", "-")
  end

  def self.find_by_slug(id: integer, name: string, artist_id: integer)
    string.gsub("-", " ")
  end

end
