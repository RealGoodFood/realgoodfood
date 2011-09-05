class CreateFoodCategories < ActiveRecord::Migration
  def self.up
    create_table :food_categories do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :food_categories
  end
end
