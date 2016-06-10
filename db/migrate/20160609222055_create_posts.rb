class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string "category"
      t.string "sub_category"
      t.integer "price"
      t.integer "visit", default: 0, null: false
      t.string "title"
      t.text "content"
      t.timestamps null: false
    end
  end
end
