class Addcolumnstorants < ActiveRecord::Migration
  add_column :rants, :created_at, :datetime
  add_column :rants, :updated_at, :datetime
end

