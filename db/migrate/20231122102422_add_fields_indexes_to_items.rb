class AddFieldsIndexesToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :category_id, :bigint, null: false

    add_reference :items, :brand, null: true, foreign_key: true
    add_reference :items, :collection, null: true, foreign_key: true
  end
end
