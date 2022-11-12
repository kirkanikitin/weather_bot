class User
  attr_accessor :name, :email, :age

  def initialize(*args)
    @name = args[0][:name]
    @email = args[0][:email]
    @age = args[0][:age]
  end

  def to_s
    "Имя: #{@name}\nПочта: #{@email}\nВозраст: #{@age}\n"
  end
end
