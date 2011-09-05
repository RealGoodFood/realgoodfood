class Profile < ActiveRecord::Base

acts_as_taggable_on :tags
acts_as_tagger

 belongs_to :user
 belongs_to :food_category
 has_many   :comments, :dependent => :destroy
 belongs_to :user
 belongs_to :listing
 belongs_to :eat_by_date
 belongs_to :location
 has_many   :values
 belongs_to :location

end
