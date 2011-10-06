class FoodCategory < ActiveRecord::Base
  
  has_many :listings
  has_many :profiles

  def funky_method
    "#{self.name}.camelize"
  end

end
