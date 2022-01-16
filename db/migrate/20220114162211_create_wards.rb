class CreateWards < ActiveRecord::Migration[6.1]
  def change
    create_table :wards do |t|
      t.string :name
      t.references :floor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
