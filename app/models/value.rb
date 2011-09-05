class Value < ActiveRecord::Base
  paginates_per 5

  has_and_belongs_to_many :listings
  belongs_to :profile
end
