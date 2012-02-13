class AddStreetAndPinCodeAndCityAndStateAndCountryToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :street, :string
    add_column :listings, :pin_code, :string
    add_column :listings, :city, :string
    add_column :listings, :country, :string
    add_column :listings, :state, :string
  end

  def self.down
    remove_column :listings, :state
    remove_column :listings, :country
    remove_column :listings, :city
    remove_column :listings, :pin_code
    remove_column :listings, :street
  end
end
