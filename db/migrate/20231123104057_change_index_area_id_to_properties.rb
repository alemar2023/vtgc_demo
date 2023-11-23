class ChangeIndexAreaIdToProperties < ActiveRecord::Migration[7.1]
  def change
    remove_index :properties, :area_id

    add_index :properties, :area_id, :unique => false
  end

end
