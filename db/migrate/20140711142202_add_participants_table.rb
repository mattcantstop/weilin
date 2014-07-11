class AddParticipantsTable < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.belongs_to :user
      t.belongs_to :war
      t.timestamps
    end
  end
end
