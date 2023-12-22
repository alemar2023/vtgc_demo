class AddIndexesToBrandI18ns < ActiveRecord::Migration[7.1]
  def change
    add_index :brand_i18ns, :locale
    add_index :brand_i18ns, [:locale , :brand_id ], unique: true
    add_index :brand_i18ns, :name
  end
end
