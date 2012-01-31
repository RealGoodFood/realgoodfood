class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string  :name
      t.text    :event_description
      t.date    :event_starting_on
      t.date    :event_ending_on
      t.integer :no_of_guests
      t.integer :no_of_guests_attending, :default => 0
      t.integer :user_id
      t.text    :address
      t.boolean :gmaps
      t.integer :event_category_id
      t.string  :ev_pot, :default => "N/A"
      t.string  :ev_swap, :default => "N/A"
      t.string  :ev_collaborative, :default => "N/A"
      t.string  :ev_party, :default => "N/A"
      t.integer :location_id
      t.string  :event_type

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
