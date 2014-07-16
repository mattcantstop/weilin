class AddDefaultValueToTallyAttributeInScoresTable < ActiveRecord::Migration
  def up
    change_column :scores, :tally, :integer, :default => 0
  end

  def down
    change_column :scores, :tally, :integer, :default => nil
  end

end
