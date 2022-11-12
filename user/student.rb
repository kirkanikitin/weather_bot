require './user'

class Student < User
  def initialize(*args)
    super(*args)
    @lessons = args[0][:lessons]
  end
end
