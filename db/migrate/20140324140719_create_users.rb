class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :is_disabled
      t.string :authentication_token

      t.timestamps
    end
    add_index :users, :username
    add_index :users, :email
  end
end
