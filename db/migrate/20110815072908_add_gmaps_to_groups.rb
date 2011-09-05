class AddGmapsToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :gmaps, :boolean
  end

  def self.down
    remove_column :groups, :gmaps
  end
end
