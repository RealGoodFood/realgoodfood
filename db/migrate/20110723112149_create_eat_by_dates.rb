class CreateEatByDates < ActiveRecord::Migration
  def self.up
    create_table :eat_by_dates do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :eat_by_dates
  end
end
