class AddDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :display_name, :string
    add_column :users, :phone_number, :string
  end
end