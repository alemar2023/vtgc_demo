class AddNameLastnameRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :string,  :null => false, :default => "user"

  end
end
