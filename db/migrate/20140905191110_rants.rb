class Rants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t. string :about
      t. text :rant
      t. string :user_id
    end
  end
end

