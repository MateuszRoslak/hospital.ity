class CreateInspections < ActiveRecord::Migration[6.1]
  def change
    create_table :inspections do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.boolean :completed, default: false
      t.text :notes

      t.timestamps
    end
  end
end
