class CreateCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :collections do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
    add_index :collections, [:name , :brand_id] , unique: true
    add_index :collections, :name
  end
end
