class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.datetime :last_cleaned
      t.integer :last_cleaned_by
      t.integer :room_type
      t.references :ward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
