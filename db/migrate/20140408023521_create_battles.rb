class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :war_id
      t.integer :winner_id
      t.integer :user_id
      t.text :notes

      t.timestamps
    end
    add_index :battles, :war_id
    add_index :battles, :winner_id
    add_index :battles, :user_id
  end
end
