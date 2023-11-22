class CreateItemI18ns < ActiveRecord::Migration[7.1]
  def change
    create_table :item_i18ns do |t|
      t.references :item, null: false, foreign_key: true
      t.string :name, null: false
      t.string :locale, null: false

      t.timestamps
    end
    add_index :item_i18ns, :name
    add_index :item_i18ns, :locale
    add_index :item_i18ns, [:locale, :item_id], unique: true

  end
end

