class AddDefaultValuesToWars < ActiveRecord::Migration
  def change
    change_column :wars, :is_complete, :boolean, default: false
    change_column :wars, :is_disabled, :boolean, default: false
  end
end
