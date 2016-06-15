class FixPriceHide < ActiveRecord::Migration
  def up
    remove_column :posts, :visible
    add_column :posts, :price_hide, :boolean, :default => false
  end
  def down
    remove_column :posts, :price_hide
    add_column :posts, :visible, :boolean, :null => false, :default => true
  end
end
