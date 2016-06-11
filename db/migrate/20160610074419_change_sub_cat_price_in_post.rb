class ChangeSubCatPriceInPost < ActiveRecord::Migration
  def up
    change_column :posts, :sub_category, :string, :default => ""
    change_column :posts, :price, :decimal, default: 0, numericality: { greater_or_equal_to: 0}
  end
  def down
    change_column :posts, :sub_category, :string
    change_column :posts, :price, :integer
  end
end
