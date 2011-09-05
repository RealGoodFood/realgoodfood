class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :address
      t.string :street
      t.string :city
      t.string :zip
      t.string :state
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
