class Api::V1::VehicleController < ApplicationController
   before_action :set_vehicle, only: [:edit, :update, :show]
   
   def index 
      @vehicles = Vehicle.all
      render json: @vehicles
   end 

   # def new 
   #    @vehicle = Vehicle.new 
   # end 

   def create 
      vin = vehicle_params[:vin]
      @vehicle = Vehicle.new(vehicle_params)
      puts @vehicle.errors
   end 

   def show 
      render json: @vehicle
   end 

   def update 
   end 

   def edit 
   end 

   private 

   def set_vehicle
      @vehicle = Vehicle.find(params[:id])
   end

   def vehicle_params 
      params.require(:vehicle).permit(:vin, :plate, :year, :make, :model, :trim, :engine_displacement, :engine_configuration, :engine_model, :drive, :number_of_cylinders, :fuel_type, :manufacturer, :plant_city, :plant_country, :horsePower, :tpms, :battery_energy, :ev_drive_unit, :name, :color, :auto_image, :user_image, :tire_size, :wheel_size)
   end
end


