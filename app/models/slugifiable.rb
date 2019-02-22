class Slugifiable

  #removes spaces replaces them with dashes
  #also special characters
  def self.slug(name)
    name.gsub(/[!@#$%^&*]/, "-").gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    slug.gsub("-", " ")
  end 

end
