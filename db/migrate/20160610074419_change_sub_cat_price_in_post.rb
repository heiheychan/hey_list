class ChangeSubCatPriceInPost < ActiveRecord::Migration
  def up
    change_column :posts, :sub_category, :string, :default => ""
    change_column :posts, :price, :decimal
  end
  def down
    change_column :posts, :sub_category, :string
    change_column :posts, :price, :integer
  end
end
