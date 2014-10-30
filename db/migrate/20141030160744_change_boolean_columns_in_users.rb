class ChangeBooleanColumnsInUsers < ActiveRecord::Migration
  change_column :users, :confirmed, :boolean, :default => false
  change_column :users, :disabled, :boolean, :default => false
  change_column :users, :admin, :boolean, :default => false
end
