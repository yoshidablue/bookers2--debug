class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :room_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
