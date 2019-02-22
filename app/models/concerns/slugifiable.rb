class Slugifiable

   def self.slug(name)
      name.gsub(/[^a-zA-Z0-9\-]/,"") 
   end

end
