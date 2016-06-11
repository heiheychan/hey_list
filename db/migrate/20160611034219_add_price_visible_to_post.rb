class AddPriceVisibleToPost < ActiveRecord::Migration
  def up
    add_column :posts, :price_visible, :boolean, :default => false
  end
  def down
    remove_column :posts, :price_visible
  end
end
