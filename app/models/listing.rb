class Listing < ActiveRecord::Base

#Validation =====================================================================================

 #validates_presence_of :title
 #validates_uniqueness_of :title, :message => "Category is alreadey taken"
 #validates_presence_of :food_category_id, :message =>"Please Select A Food Category" 
 #validates_presence_of :location_id, :message => "please Select a location"  
 #validates_presence_of :event_starting_on, :message => "specify a starting date of the event"
 #validates_presence_of :event_ending_on, :message => "Specify an ending date of the event "

#=================================================================================================

 acts_as_taggable_on :tags  #tags definition 

#-================================================================================================

# linking or joining of model 

 belongs_to :user
 belongs_to :food_category
 has_many   :comments, :dependent => :destroy
 belongs_to :user
 belongs_to :profile
 belongs_to :eat_by_date
 belongs_to :location
 has_and_belongs_to_many :values

 has_and_belongs_to_many :events

#==================================================================================================


#has_attached_file :photo, :styles => { :small => "150x150>" },
 #                 :url  => "/assets/listings/:id/:style/:basename.:extension",
 #                 :path => ":rails_root/public/assets/listings/:id/:style/:basename.:extension"

#validates_attachment_presence :photo
#validates_attachment_size :photo, :less_than => 5.megabytes
#validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  
	
end
