class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.integer :beds, default: 0
      t.integer :patients, default: 0
      t.boolean :tv, default: false
      t.boolean :fire_extinguisher, default: false
      t.datetime :last_cleaned, default: DateTime.now
      
      t.timestamps
    end
  end
end
