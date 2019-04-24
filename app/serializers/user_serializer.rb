class UserSerializer < ActiveModel::Serializer
   attributes :id, :first_name, :last_name, :email, :password, :username, :phone
 
   has_many :vehicles
   has_many :logs, through: :vehicles
   has_many :notes, through: :vehicles
 
 end
 