class ChangeColumnName < ActiveRecord::Migration
  rename_column :users, :password_sent_at, :password_reset_sent_at
end
