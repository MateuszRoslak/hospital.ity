class CreateCleaningRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :cleaning_requests do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :room_ids, array: true, default: []
      t.boolean :completed, default: false
      t.integer :cleaning_report_id

      t.timestamps
    end
  end
end
