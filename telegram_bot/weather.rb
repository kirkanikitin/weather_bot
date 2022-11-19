require 'http'
require 'json'
require './prettify_concern/prettify'
require './prettify_concern/current_day'

API_KEY = "672f76dc449f4e36a15143922220811"

class Weather
  def self.current(query)
    response = HTTP.get("http://api.weatherapi.com/v1/current.json?key=#{API_KEY}&q=#{query}&aqi=no").to_s
    data = JSON.parse(response)
    CurrentDay.new(data)
  end

  def self.current_by(lat, lon)
    response = HTTP.get("http://api.weatherapi.com/v1/current.json?key=#{API_KEY}&q=#{lat},#{lon}&aqi=no").to_s
    p response
    data = JSON.parse(response)
    CurrentDay.new(data)
  end

  # def self.tree_days(query)
  #   TreeDays.new(JSON.parse(HTTP.get("http://api.weatherapi.com/v1/current.json?key=#{API_KEY}&q=#{query}&aqi=no").to_s))
  # end
end
