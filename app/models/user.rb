class User < ApplicationRecord
   has_many :vehicles
   has_many :notes, through: :vehicles
   has_many :logs, through: :vehicles
end
