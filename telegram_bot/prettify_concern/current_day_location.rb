class CurrentDayLocation
  include Prettify

  def initialize(data)
    @data = data
  end

  def to_s
    s = "Город: #{@data["location"]["name"]}\n"
    s += "Температура c: #{@data["current"]["temp_c"]}\n"
    s += "Температура f: #{@data["current"]["temp_f"]}\n"
    s += "Дата: #{@data["current"]["last_updated"]}"
    s
  end
end
