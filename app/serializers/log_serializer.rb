class LogSerializer < ActiveModel::Serializer
  attributes :id, :mileage, :title, :description, :note, :complete, :date_due, :date_completed, :difficulty
  
  belongs_to :vehicle
 
 end
 