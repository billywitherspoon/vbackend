class LogController < ApplicationController
      before_action :set_log, only: [:edit, :update, :show]
      
      def index 
         @logs = Log.all
      end 
   
      def new 
         @log = Log.new 
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
   
      def set_log
         @log = Log.find(params[:id])
      end
   
      def log_params 
         params.require(:log).permit(:mileage, :title, :description, :note, :complete, :date_due, :date_completed, :difficulty)
      end
end
