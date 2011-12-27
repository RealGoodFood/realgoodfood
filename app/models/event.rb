class Event < ActiveRecord::Base

  has_many :groups  
  belongs_to :profile
  belongs_to :user
  has_and_belongs_to_many :listings
  has_many :member_attending_event_registers, :dependent => :destroy
  has_many :users, :through => :member_attending_event_registers
belongs_to :event_category

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
    self.address
   end

   def gmaps4rails_infowindow
    "<h4>#{name}</h4>" << "<h4>#{address}</h4>"
   end

end
