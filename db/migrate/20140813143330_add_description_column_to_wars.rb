class AddDescriptionColumnToWars < ActiveRecord::Migration
  def change
    add_column :wars, :description, :text
  end
end
