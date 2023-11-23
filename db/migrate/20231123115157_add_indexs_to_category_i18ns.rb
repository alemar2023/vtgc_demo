class AddIndexsToCategoryI18ns < ActiveRecord::Migration[7.1]
  def change
    add_index :category_i18ns, :locale
    add_index :category_i18ns, [:locale , :category_id ], unique: true
    add_index :category_i18ns, :name
  end
end
