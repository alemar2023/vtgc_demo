class CreateItemValues < ActiveRecord::Migration[7.1]
  def change
    create_table :item_values do |t|
      t.string :value, null:false
      t.references :item, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
