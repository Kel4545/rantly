class AddTokenToUsersColumn < ActiveRecord::Migration
  add_column :users, :token, :string
end
