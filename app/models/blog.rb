class Blog < ActiveRecord::Base
  extend FriendlyId
 friendly_id :title, :use => :slugged
  paginates_per 3
end
