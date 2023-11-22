class AddIndexCategoryToItems < ActiveRecord::Migration[7.1]
  def change
  end
  add_index :items, :category_id
end
