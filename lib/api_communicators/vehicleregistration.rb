require 'rest-client'
require 'json'
require_relative './apikeys.rb'
require 'json'
require 'net/http'
require 'active_support/core_ext/hash'

class VehicleRegistration

   #takes an argument of the plate and state
   #uses api to return a vin
   #includes a rescue if a plate/state returns no results
   def self.get_vin(plate, state)
      begin
         result = RestClient.get("http://www.vehicleregistrationapi.com/api/reg.asmx/CheckUSA?RegistrationNumber=#{plate}&State=#{state}&username=#{$vr_username}")

         return JSON.parse(Hash.from_xml(result)["Vehicle"]["vehicleJson"])["VechileIdentificationNumber"].downcase
      rescue 
         return nil
      end
   end
end
