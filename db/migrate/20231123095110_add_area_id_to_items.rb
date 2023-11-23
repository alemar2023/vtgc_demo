class AddAreaIdToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :area_id, :bigint, null:false
  end

end
