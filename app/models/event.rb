class Event < ActiveRecord::Base

  has_attached_file :photo, :styles =>
                   {:medium => "300x300>", :small => "50x50>", :thumb => "75x75>" }

   belongs_to :user

   belongs_to :event_category

   has_and_belongs_to_many :listings

  attr_accessor :listing_list


# Mapping Google Maps*
#---------------------------------------------------------------------
   acts_as_gmappable

   def gmaps4rails_address
    address
   end

   def gmaps4rails_infowindow
    "<h4>#{name}</h4>" << "<h4>#{address}</h4>"
   end
#----------------------------------------------------------------------


end
