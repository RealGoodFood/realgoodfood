class EventsListings < ActiveRecord::Migration
  def self.up
       create_table :events_listings, :id => false, :force => true do |t|
            t.integer :event_id
            t.integer :listing_id
            t.timestamps
        end
    end
 
    def self.down
        drop_table :events_listings
    end
end
