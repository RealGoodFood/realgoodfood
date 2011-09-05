class AddTagToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :tag, :string
  end

  def self.down
    remove_column :groups, :tag
  end
end
