class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :vin, :plate, :model_year, :make, :model, :trim, :displacement_l, :engine_configuration, :engine_model, :drive, :engine_number_of_cylinders, :fuel_type, :manufacturer_name, :plant_city, :plant_state, :plant_country, :engine_brake_hp, :tpms, :name, :color, :auto_image, :user_image, :tire_size_front, :tire_size_rear, :wheel_size_front_inches, :wheel_size_rear_inches, :series, :body_class, :trim2, :doors, :gross_vehicle_weight_rating, :engine_manufacturer, :turbo, :brake_system_type, :top_speed_mph, :mileage
  
  has_many :logs
  has_many :notes
  belongs_to :user
 
 end
 