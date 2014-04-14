class UsersWars < ActiveRecord::Migration
  def change
    create_table :users_wars, :id => false do |t|
      t.integer :user_id
      t.integer :user_id
    end
  end
end
