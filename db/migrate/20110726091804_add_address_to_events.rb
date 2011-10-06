class AddAddressToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :address, :text
  end

  def self.down
    remove_column :events, :address
  end
end
