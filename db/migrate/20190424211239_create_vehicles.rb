class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :vin
      t.string :plate
      t.string :model_year
      t.string :make
      t.string :model
      t.string :trim
      t.string :displacement_l
      t.string :displacement_ci
      t.string :engine_configuration
      t.string :engine_model
      t.string :drive_type
      t.string :engine_number_of_cylinders
      t.string :manufacturer_name
      t.string :plant_city
      t.string :plant_state
      t.string :plant_country
      t.string :engine_brake_hp
      t.string :tpms
      t.string :name
      t.string :color
      t.string :auto_image
      t.string :user_image
      t.string :tire_size_front
      t.string :tire_size_rear
      t.string :wheel_size_front_inches
      t.string :wheel_size_rear_inches
      t.string :series
      t.string :body_class
      t.string :trim2
      t.string :doors
      t.string :engine_manufacturer
      t.string :turbo
      t.string :brake_system_type
      t.string :top_speed_mph
      t.string :valve_train_design
      t.string :fuel_type_primary
      t.string :transmission_style
      t.string :transmission_speeds
      t.integer :mileage
      t.integer :user_id
    
      t.timestamps
    end
  end
end
