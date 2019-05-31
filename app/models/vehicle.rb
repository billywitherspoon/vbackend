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
      #error codes from this API aren't consistent
      #this checks if there is a make returned for the vin, if so, it is a good vin
      if self.make
         self.save
      else
        return nil
      end
   end

   #calls the CARMD api to add the maintenance data
   def add_maint_data
      maint_data = CARMD.maint(self.vin, self.mileage)
      maint_data["data"].each do |d|
         unless Log.find_by(title: d["desc"], mileage: d["due_mileage"])
            if d["repair"]["repair_difficulty"]
               log = Log.new(title: d["desc"], mileage: d["due_mileage"], difficulty: d["repair"]["repair_difficulty"])
            else 
               log = Log.new(title: d["desc"], mileage: d["due_mileage"])
            end
            log.vehicle = self 
            log.save
         end
      end
      self.save
   end

   #uses the CARMD api to add a stock image of the vehicle
   def add_image 
      image = CARMD.image(self.vin)
      if image == ""
         image = "http://clipart-library.com/img/2050778.png"
      end
      self.auto_image = image 
      self.save 
   end 

   #uses the VehicleRegistration to pass a plate and return a vin
   def get_vin_by_plate
       vin = VehicleRegistration.get_vin(self.plate, self.plate_state)
       if vin && vin.class == String && vin.length > 8 && vin.length < 20
         self.vin = vin
       else  
         return nil
       end 
   end
end
