class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands do |t|
      t.references :area, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
    add_index :brands, [:name , :area_id] , unique: true
    add_index :brands, :name
  end
end
