class Favorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :rant_id
      t.string :user_id
    end
  end
end
