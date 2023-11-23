class AddAreaIndexToProperties < ActiveRecord::Migration[7.1]
  def change
  end
  add_index :properties, :area_id, unique: true
end
