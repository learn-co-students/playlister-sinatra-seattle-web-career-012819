class Slugifiable

   def self.slug(name)
      name.downcase.split(" ").join("-").remove("'")
   end

end
