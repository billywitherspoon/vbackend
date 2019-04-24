class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.integer :mileage
      t.string :title
      t.text :description
      t.text :note
      t.boolean :complete
      t.date :date_due
      t.date :date_completed
      t.integer :difficulty
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
