class AddDefaultToRantSpam < ActiveRecord::Migration
  change_column :rants, :spam, :boolean, :default => false
end
