class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :vin, :plate, :model_year, :make, :model, :trim, :displacement_l, :displacement_ci, :engine_configuration, :engine_model, :drive_type, :engine_number_of_cylinders, :manufacturer_name, :plant_city, :plant_state, :plant_country, :engine_brake_hp, :tpms, :name, :color, :auto_image, :user_image, :tire_size_front, :tire_size_rear, :wheel_size_front_inches, :wheel_size_rear_inches, :series, :body_class, :trim2, :doors, :engine_manufacturer, :turbo, :brake_system_type, :top_speed_mph, :valve_train_design, :fuel_type_primary, :transmission_style, :transmission_speeds, :mileage
  
  has_many :logs
  has_many :notes
 
 end
 