class AddColumnToUsers < ActiveRecord::Migration
  add_column :users, :remember_token, :string
  remove_column :users, :token, :string
end
