class AddColumnToRants < ActiveRecord::Migration
  add_column :rants, :spam, :boolean, defailt: false
end
