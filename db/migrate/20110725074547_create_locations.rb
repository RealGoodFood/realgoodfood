class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string   :address
      t.string   :street
      t.string   :city
      t.string   :zip
      t.string   :state
      t.string   :country
      t.float    :latitude
      t.float    :longitude
      t.boolean  :gmaps
      t.integer  :profile_id
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
