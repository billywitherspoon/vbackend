class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :vin
      t.string :plate
      t.string :year
      t.string :make
      t.string :model
      t.string :trim
      t.string :engine_displacement
      t.string :engine_configuration
      t.string :engine_model
      t.string :drive
      t.string :number_of_cylinders
      t.string :fuel_type
      t.string :manufacturer
      t.string :plant_city
      t.string :plant_country
      t.string :horsePower
      t.boolean :tpms
      t.string :battery_energy
      t.string :ev_drive_unit
      t.string :name
      t.string :color
      t.string :auto_image
      t.string :user_image
      t.string :tire_size
      t.string :wheel_size
      t.integer :user_id

      t.timestamps
    end
  end
end
