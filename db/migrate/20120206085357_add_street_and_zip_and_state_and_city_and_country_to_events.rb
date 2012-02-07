class AddStreetAndZipAndStateAndCityAndCountryToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :street, :string
    add_column :events, :zip, :integer
    add_column :events, :state, :string
    add_column :events, :city, :string
    add_column :events, :country, :string
  end

  def self.down
    remove_column :events, :country
    remove_column :events, :city
    remove_column :events, :state
    remove_column :events, :zip
    remove_column :events, :street
  end
end
