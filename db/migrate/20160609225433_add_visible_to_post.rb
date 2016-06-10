class AddVisibleToPost < ActiveRecord::Migration
  def change
    add_column :posts, :visible, :boolean, :null => false, :default => true
  end
end
