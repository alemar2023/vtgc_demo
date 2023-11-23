class AddAreaIdToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :area_id, :bigint
  end
end
