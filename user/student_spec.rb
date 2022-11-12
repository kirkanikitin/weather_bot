require 'rspec'
require './student'


RSpec.describe Student do
  before(:each) do
    @student = Student.new(name: "Вася", email: "grisha@example.com", age: 16, lessons: ["matematika", "literatura"])
  end
  describe "Создание и редактирование пользователя" do
    it "Создаст пользователя" do
      expect(@student.name).to eq("Вася")
      expect(@student.email).to eq("grisha@example.com")
      expect(@student.age).to eq(16)
    end

    it "Поменяет имя пользователя" do
      expect(@student.name).to eq("Вася")
      @student.name = "Гоша"
      expect(@student.name).to eq("Гоша")
    end

    it "Поменяет почту  пользователя" do
      expect(@student.email).to eq("grisha@example.com")
      @student.email = "gosha@gmail.com"
      expect(@student.email).to eq("gosha@gmail.com")
    end

    it "Поменяет возрост пользователя" do
      expect(@student.age).to eq(16)
      @student.age = 12
      expect(@student.age).to eq(12)
    end
  end

  describe "Информации о пользователе" do
    it "Вернёт строку с данными о пользователе" do
      expect(@student.to_s).to eq("Имя: Вася\nПочта: grisha@example.com\nВозраст: 16\n")
    end

    it "Вернёт строку с данными о пользователе после редактирования имени" do
      expect(@student.to_s).to eq("Имя: Вася\nПочта: grisha@example.com\nВозраст: 16\n")
      @student.name = "Кеша"
      expect(@student.to_s).to eq("Имя: Кеша\nПочта: grisha@example.com\nВозраст: 16\n")
    end
  end
end

