require 'rest-client'
require 'json'
require_relative './apikeys.rb'
require 'json'
require 'net/http'
require 'active_support/core_ext/hash'

class VehicleRegistration

   def self.get_vin(plate, state)
      result = RestClient.get("http://www.vehicleregistrationapi.com/api/reg.asmx/CheckUSA?RegistrationNumber=#{plate}&State=#{state}&username=#{$vr_username}")

      JSON.parse(Hash.from_xml(result)["Vehicle"]["vehicleJson"])["VechileIdentificationNumber"].downcase
   end

end
