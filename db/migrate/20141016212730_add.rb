class Add < ActiveRecord::Migration
  class AddColumnToRants < ActiveRecord::Migration
    add_column :rants, :favorites_count, :integer, default: 0

  end
end
