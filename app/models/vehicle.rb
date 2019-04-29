class Vehicle < ApplicationRecord
   has_many :notes
   has_many :logs
   belongs_to :user

   # validates :vin, uniqueness: true

   def add_nhtsa_data(vehicle_params)
      vin = vehicle_params[:vin]
      user_id = vehicle_params[:user_id]
      self.vin = vin
      self.user_id = 1
      data = NHTSA.data(vin)["Results"]
      data.each do |d| 
         d_snaked = d["Variable"].downcase.gsub(/ /,"_").gsub(/\(|\)/,"")
         if self.attributes.keys.include?(d_snaked)
            self[d_snaked] = d["Value"]
         end
      end
      #error codes from this API aren't great, so simply saying if a model is returned, it must have found a matching make
      if self.make
         self.save
      else
        return "NO MATCH"
      end
   end
end