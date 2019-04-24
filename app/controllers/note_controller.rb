class NoteController < ApplicationController
      before_action :set_note, only: [:edit, :update, :show]
      
      def index 
         @notes = Note.all
      end 
   
      def new 
         @note = Note.new 
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
   
      def set_note
         @note = Note.find(params[:id])
      end
   
      def note_params 
         params.require(:note).permit(:title, :body)
      end
end
