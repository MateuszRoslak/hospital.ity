class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :model
      t.string :manufacturer
      t.integer :device_type
      t.integer :status
      t.references :room, null: true, foreign_key: true

      t.timestamps
    end
  end
end
