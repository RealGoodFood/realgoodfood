class ListingsValues < ActiveRecord::Migration
  def self.up
	create_table :listings_values, :id => false do |t|
        	t.references :value
		t.references :listing
       end
  end

  def self.down
	drop_table :listings_values
  end
end