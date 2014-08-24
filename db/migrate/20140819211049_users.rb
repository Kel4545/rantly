class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :bio
      t.string :password_digest
      t.string :frequency

      t.timestamps
    end
  end
end
