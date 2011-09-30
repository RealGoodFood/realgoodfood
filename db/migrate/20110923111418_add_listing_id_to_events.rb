class AddListingIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :listing_id, :integer
  end

  def self.down
    remove_column :events, :listing_id
  end
end
