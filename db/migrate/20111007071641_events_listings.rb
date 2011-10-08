class EventsListings < ActiveRecord::Migration
  def self.up
	create_table :events_listings, :id => false do |t|
        	t.references :event
		t.references :listing
		end
  end

  def self.down
	drop_table :events_listings
  end
end
