

class Api::V1::VehiclesController < ApplicationController
   before_action :set_vehicle, only: [:edit, :update, :show]
   
   def index 
      @vehicles = Vehicle.all
      render json: @vehicles
   end 

   # def new 
   #    @vehicle = Vehicle.new 
   # end 

   def create 
      @vehicle = Vehicle.new(vehicle_params)
      unless @vehicle.vin
         unless @vehicle.get_vin_by_plate
          errors = {"errors" => "NO MATCH"}
            render json: errors
            return
         end
      end
      unless @vehicle.add_nhtsa_data
         errors = {"errors" => "NO MATCH"}
         render json: errors
         return 
      end
      @vehicle.add_image
      @vehicle.add_maint_data
      render json: @vehicle, include: "*"
   end 

   def show 
      render json: @vehicle
   end 

   def update 
      @vehicle.mileage = vehicle_params[:mileage]
      @vehicle.add_maint_data
      render json: @vehicle
   end 

   # def edit 
   # end 

   private 

   def set_vehicle
      @vehicle = Vehicle.find(params[:id])
   end

   def vehicle_params 
      params.require(:vehicle).permit(:vin, :plate, :year, :make, :model, :trim, :engine_displacement, :engine_configuration, :engine_model, :drive, :number_of_cylinders, :fuel_type, :manufacturer, :plant_city, :plant_state, :plant_country, :horsePower, :tpms, :battery_energy, :ev_drive_unit, :name, :color, :auto_image, :user_image, :tire_size, :wheel_size, :user_id, :mileage, :plate_state)
   end
end


