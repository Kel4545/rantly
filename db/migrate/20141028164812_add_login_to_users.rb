class AddLoginToUsers < ActiveRecord::Migration
  add_column :users, :login, :string
end
