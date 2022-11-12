require 'rspec'
require './user'


RSpec.describe User do
  before(:each) do
    @user = User.new(name: "Вася", email: "grisha@example.com", age: 16)
  end

  describe "Создание и редактирование пользователя" do
    it "Создаст пользователя" do
      expect(@user.name).to eq("Вася")
      expect(@user.email).to eq("grisha@example.com")
      expect(@user.age).to eq(16)
    end

    it "Поменяет имя пользователя" do
      expect(@user.name).to eq("Вася")
      @user.name = "Гоша"
      expect(@user.name).to eq("Гоша")
    end

    it "Поменяет почту  пользователя" do
      expect(@user.email).to eq("grisha@example.com")
      @user.email = "gosha@gmail.com"
      expect(@user.email).to eq("gosha@gmail.com")
    end

    it "Поменяет возрост пользователя" do
      expect(@user.age).to eq(16)
      @user.age = 12
      expect(@user.age).to eq(12)
    end
  end

  describe "Информации о пользователе" do
    it "Вернёт строку с данными о пользователе" do
      expect(@user.to_s).to eq("Имя: Вася\nПочта: grisha@example.com\nВозраст: 16\n")
    end

    it "Вернёт строку с данными о пользователе после редактирования имени" do
      expect(@user.to_s).to eq("Имя: Вася\nПочта: grisha@example.com\nВозраст: 16\n")
      @user.name = "Кеша"
      expect(@user.to_s).to eq("Имя: Кеша\nПочта: grisha@example.com\nВозраст: 16\n")
    end
  end
end

