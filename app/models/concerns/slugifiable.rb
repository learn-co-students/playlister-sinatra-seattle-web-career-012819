class Slugifiable

   def self.slug(name)
      name.split(" ").join("-")
   end

end
