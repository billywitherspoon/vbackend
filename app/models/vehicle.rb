class Vehicle < ApplicationRecord
   has_many :notes
   has_many :logs
   belongs_to :user

   # validates :vin, uniqueness: true

   def add_nhtsa_data
      data = NHTSA.data(self.vin)["Results"]
      data.each do |d| 
         d_snaked = d["Variable"].downcase.gsub(/ - /,"_").gsub(/ /,"_").gsub(/[\(\)-]/,"")
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

   def add_maint_data
      maint_data = CARMD.maint(self.vin, self.mileage)
      maint_data["data"].each do |d|
         unless Log.find_by(title: d["desc"], mileage: d["due_mileage"])
            log = Log.new(title: d["desc"], mileage: d["due_mileage"])
            log.vehicle = self 
            log.save
         end
      end
      self.save
   end

   def get_vin_by_plate
       vin = VehicleRegistration.get_vin(self.plate, self.plate_state)
       if vin && vin.class == String && vin.length > 8 && vin.length < 20
         self.vin = vin
       else  
         return "NO MATCH"
       end 
   end
end
