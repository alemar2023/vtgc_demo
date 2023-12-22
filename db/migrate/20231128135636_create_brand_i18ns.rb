class CreateBrandI18ns < ActiveRecord::Migration[6.0]
  def change
    create_table :brand_i18ns do |t|
      t.bigint :brand_id, null:false
      t.string :name, null:false
      t.string :locale, default: "en"

      t.timestamps
    end

    add_index :brand_i18ns, :brand_id
  end
end
