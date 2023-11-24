class RemoveAreaIdFromProperies < ActiveRecord::Migration[7.1]
  def change
    remove_index :properties, :area_id
  end
end
