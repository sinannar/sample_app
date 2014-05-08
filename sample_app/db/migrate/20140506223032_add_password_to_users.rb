class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :encryped_password, :string
  end
end
