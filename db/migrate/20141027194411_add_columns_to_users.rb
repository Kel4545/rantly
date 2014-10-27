class AddColumnsToUsers < ActiveRecord::Migration
  add_column :users, :admin, :boolean
  add_column :users, :confirmed, :boolean
  add_column :users, :disabled, :boolean
end
