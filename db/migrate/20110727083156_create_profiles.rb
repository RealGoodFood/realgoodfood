class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string  :full_name
      t.integer :contact_number
      t.date    :date_of_birth
      t.integer :value_id
      t.integer :user_id
      t.string  :slug
      t.string  :facebook_profile_link
      t.string  :twitter_profile_link
      t.string  :google_plus_profile_link
      t.string  :linked_in_profile_link
      t.text    :about_me

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
