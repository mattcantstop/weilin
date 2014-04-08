class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :war_id
      t.integer :user_id

      t.timestamps
    end
    add_index :participants, :war_id
    add_index :participants, :user_id
  end
end
