class Rants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t. string :rant
      t. string :user_id
    end
  end
end
