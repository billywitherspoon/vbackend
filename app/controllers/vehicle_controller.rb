class VehicleController < ApplicationController
   before_action :set_vehicle, only: [:edit, :update, :show]
   
   def index 
      @vehicles = Vehicle.all
   end 

   def new 
      @vehicle = Vehicle.new 
   end 

   def create 
   end 

   def show 
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
      params.require(:vehicle).permit(:name, :id)
   end
end


