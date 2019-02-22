module Slugable

  def slug
    new_name = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  module ClassMethods
    def find_by_slug(slug)
      all_slugs = self.all.each_with_object({}) { |obj, h| h[obj.slug] = obj }
      all_slugs[slug]

    end
  end
end
