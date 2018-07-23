class Post < ActiveRecord::Base
  has_many :post_locations
  has_many :categories, through: :post_categories


  def locations_attributes=(location_attributes)
    location_attributes.values.each do |location_attribute|
      location = Category.find_or_create_by(location_attribute)
      self.projects.build(location: location)
    end
  end

end
