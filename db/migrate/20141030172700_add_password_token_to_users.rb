class AddPasswordTokenToUsers < ActiveRecord::Migration
  add_column :users, :password_reset_token, :string
  add_column :users, :password_sent_at, :datetime
end
