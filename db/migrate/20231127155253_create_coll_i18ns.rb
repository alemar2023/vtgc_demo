class CreateCollI18ns < ActiveRecord::Migration[7.1]
  def change
    create_table :coll_i18ns do |t|

      t.references :collection, null: false, foreign_key: true
      t.string :name, null: false
      t.string :locale, null: false

      t.timestamps
    end
    add_index :coll_i18ns, :name
    add_index :coll_i18ns, :locale
    add_index :coll_i18ns, [:locale , :collection_id ], unique: true
  end
end
