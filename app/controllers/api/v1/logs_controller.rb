class Api::V1::LogsController < ApplicationController
      before_action :set_log, only: [:update, :show, :destroy]
      
      def index 
         @logs = Log.all
         render json: @logs
      end 
   
      def new 
      end 
   
      def create 
         @log = Log.new(log_params) 
         if @log.save
            render json: @log.vehicle
         else 
            render json: @log.errors
         end
      end 
   
      def show 
         render json: @log
      end 
   
      def update 
         @log.update(log_params)
         render json: @log.vehicle
      end 

      def destroy
         @log.delete
         if @log
            render json: "Log NOT deleted from database"
         else 
            render json: "Log successfully deleted from database"
         end
      end
   
      # def edit 
      # end 
   
      private 
   
      def set_log
         @log = Log.find(params[:id])
      end
   
      def log_params 
         params.require(:log).permit(:mileage, :title, :description, :note, :complete, :date_due, :date_completed, :difficulty, :vehicle_id)
      end
end
