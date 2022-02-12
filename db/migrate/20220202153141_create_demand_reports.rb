class CreateDemandReports < ActiveRecord::Migration[6.1]
  def change
    create_table :demand_reports do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
