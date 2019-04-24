class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :vin, :plate, :year, :make, :model, :trim, :engine_displacement, :engine_configuration, :engine_model, :drive, :number_of_cylinders, :fuel_type, :manufacturer, :plant_city, :plant_country, :horsePower, :tpms, :battery_energy, :ev_drive_unit, :name, :color, :auto_image, :user_image, :tire_size, :wheel_size
  
  has_many :logs
  has_many :notes
  belongs_to :user
 
 end
 