class UserController < ApplicationController
   before_action :set_user, only: [:edit, :update, :show]
   
   def index 
      @users = User.all
   end 

   def new 
      @user = User.new 
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

   def set_user
      @user = User.find(params[:id])
   end

   def user_params 
      params.require(:user).permit(:first_name, :last_name, :email, :password, :username, :phone)
   end
end
