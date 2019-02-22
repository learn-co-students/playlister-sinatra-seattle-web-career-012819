class Slugifiable

   def self.slug(name)
      name.downcase.split(" ").join("-")
   end

end
