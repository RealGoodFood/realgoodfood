class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :first_nams
      t.string :last_name
      t.integer :value_id
      t.integer :user_id
      t.text :about_me

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
