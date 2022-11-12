require 'http'
require 'json'

API_KEY = "672f76dc449f4e36a15143922220811"

class Weather
  def self.current(query)
    JSON.parse(HTTP.get("http://api.weatherapi.com/v1/current.json?key=#{API_KEY}&q=#{query}&aqi=no").to_s)
  end
end
