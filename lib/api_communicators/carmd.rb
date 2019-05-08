require 'rest-client'
require 'json'
require_relative './apikeys.rb'

class CARMD

   def self.maint(vin, mileage)
      JSON.parse(RestClient::Request.execute(
         :method => :get,
         :url => "http://api.carmd.com/v3.0/maint?vin=#{vin}&mileage=#{mileage}",
         :headers => {"content-type" => "application/json",
                  "partner-token" => $car_md_token,
                  "authorization" => $car_md_key}
      ))
   end

   def self.image(vin)
      imageHash = JSON.parse(RestClient::Request.execute(
       :method => :get,
       :url => "http://api.carmd.com/v3.0/image?vin=#{vin}",
      :headers => {"content-type" => "application/json",
                  "partner-token" => $car_md_token,
                  "authorization" => $car_md_key}
      ))
      if imageHash["message"]["message"] == "ok"
         return imageHash["data"]["image"]
      else
         return "no image"
      end
   end

end

