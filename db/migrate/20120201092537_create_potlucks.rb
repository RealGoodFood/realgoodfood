class CreatePotlucks < ActiveRecord::Migration
  def self.up
    create_table :potlucks do |t|
      t.integer :event_id
      t.string :food_name
      t.integer :food_for_people
      t.string :food_type

      t.timestamps
    end
  end

  def self.down
    drop_table :potlucks
  end
end
