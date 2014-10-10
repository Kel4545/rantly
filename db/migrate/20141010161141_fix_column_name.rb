class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :follows, :user_id, :follower_id
  end
end
