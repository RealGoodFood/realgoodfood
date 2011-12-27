class Group < ActiveRecord::Base
 has_many :users

  has_attached_file :photo,
     :styles  =>
      {
       :icon     =>    "50x50", 
       :thumb    =>    "90x90",
       :profile  =>    "150x150", 
       :small    =>    "400x400>"
      }  


 
 acts_as_gmappable

 def gmaps4rails_address
    location
 end

 def gmaps4rails_infowindow
  "<h4>#{name}</h4>" << "<h4>#{location}</h4>"
 end


end
