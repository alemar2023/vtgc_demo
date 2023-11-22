
class AddTypeIndexToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :type, :string
  end
  add_index :properties, :name, unique: true
end
