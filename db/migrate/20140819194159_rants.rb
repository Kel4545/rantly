class Rants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t. string :rant
    end
  end
end
