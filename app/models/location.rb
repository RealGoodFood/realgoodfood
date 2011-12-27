class Location < ActiveRecord::Base

 belongs_to :profile
 has_many :listings
 
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['address LIKE ?', search_condition])
  end


 acts_as_gmappable

 def gmaps4rails_address
    address
 end

 def gmaps4rails_infowindow
  "<h4>#{city}</h4>" << "<h4>#{address}</h4>"
 end


end
