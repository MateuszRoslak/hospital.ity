class CreateCleaningReports < ActiveRecord::Migration[6.1]
  def change
    create_table :cleaning_reports do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :room_ids, array: true, default: []

      t.timestamps
    end
  end
end
