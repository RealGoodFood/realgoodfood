class AddEventIdToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :event_id, :integer
  end

  def self.down
    remove_column :listings, :event_id
  end
end
