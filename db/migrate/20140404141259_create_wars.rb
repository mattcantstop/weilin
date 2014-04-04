class CreateWars < ActiveRecord::Migration
  def change
    create_table :wars do |t|
      t.string :name
      t.boolean :has_end
      t.datetime :ending_date
      t.integer :ending_score
      t.string :prize
      t.boolean :is_private
      t.boolean :open_registration
      t.boolean :is_complete
      t.integer :winner_id
      t.integer :owner_id
      t.boolean :is_disabled

      t.timestamps
    end
    add_index :wars, :name
    add_index :wars, :owner_id
  end
end
