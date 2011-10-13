class Event < ActiveRecord::Base
  
  belongs_to :user
  has_and_belongs_to_many :listings

  has_attached_file :photo,
     :styles  =>
      {
       :icon     =>    "50x50", 
       :thumb    =>    "100x100",
       :profile  =>    "150x150", 
       :small    =>    "400x400>"
      }  

  acts_as_gmappable

   def gmaps4rails_address
    self.address
   end

   def gmaps4rails_infowindow
    "<h4>#{name}</h4>" << "<h4>#{address}</h4>"
   end

end
