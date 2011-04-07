class RemoveSortFromItem < ActiveRecord::Migration
  def self.up
    remove_column :items, :sort
  end

  def self.down
    add_column :items, :sort, :integer
  end
end
