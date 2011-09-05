class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.text :event_description
      t.date :event_starting_on
      t.date :event_ending_on
      t.boolean :attending
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
