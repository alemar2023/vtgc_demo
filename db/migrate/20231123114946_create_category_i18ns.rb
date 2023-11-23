class CreateCategoryI18ns < ActiveRecord::Migration[7.1]
  def change
    create_table :category_i18ns do |t|
      t.string :name
      t.string :locale
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end