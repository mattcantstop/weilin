class AddScoresTable < ActiveRecord::Migration

  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :war_id
      t.integer :tally
      t.timestamps
    end
  end

end
