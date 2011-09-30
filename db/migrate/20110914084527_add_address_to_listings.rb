class AddAddressToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :address, :string
  end

  def self.down
    remove_column :listings, :address
  end
end
