class AddAreaIndexToItems < ActiveRecord::Migration[7.1]
  def change
  end
  add_index :items, :area_id, unique: true
end
