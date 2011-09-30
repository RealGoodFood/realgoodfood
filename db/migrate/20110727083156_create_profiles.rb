class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string 	:full_name
      t.text 	:address_1
      t.text 	:address_2
      t.integer :contact_number
      t.string 	:status
      t.string 	:country
      t.string 	:state
      t.string 	:city 
      t.integer :postal_address
      t.date 	:date_of_birth
      t.text 	:about_me
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
