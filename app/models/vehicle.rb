class Vehicle < ApplicationRecord
   has_many :notes
   has_many :logs
   belongs_to :user
end
