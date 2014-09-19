class Follows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.string :follower_id
      t.string :followee_id
    end
  end
end
