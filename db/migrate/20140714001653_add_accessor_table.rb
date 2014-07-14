class AddAccessorTable < ActiveRecord::Migration
  def change
    create_table :accessors do |t|
      t.string :name
      t.text :api_key

      t.timestamps
    end
  end
end
