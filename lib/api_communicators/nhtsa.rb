require 'rest-client'
require 'json'

class NHTSA
   #obtains vehicle specs by the VIN
   def self.data(vin)
      JSON.parse(RestClient.get("https://vpic.nhtsa.dot.gov/api/vehicles/decodevin/#{vin}?format=json"))
   end
end
