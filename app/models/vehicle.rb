class Vehicle < ApplicationRecord
   has_many :notes
   has_many :logs
   belongs_to :user

   def add_nhtsa_data(vin)
      data = NHTSA.data(vin)["Results"]
      #error codes aren't great, so simply saying if a model is returned, it must have found a matching vehicle
      if data["Variable"]["Make"]
         data.each do |d| 
            d_snaked = d["Variable"].downcase.gsub(/ /,"_").gsub(/\(|\)/,"")
            if self.attributes.keys.include?(d_snaked)
               self[d_snaked] = d["Value"]
            end
         end
         self.user_id = 1
         self.save
      else 
         self.errors << "No vehicle found matching vin"
      end
   end
end
