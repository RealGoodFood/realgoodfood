class Group < ActiveRecord::Base
 has_many :users
 
 acts_as_gmappable

 def gmaps4rails_address
    location
 end

 def gmaps4rails_infowindow
  "<h4>#{name}</h4>" << "<h4>#{location}</h4>"
 end


end
