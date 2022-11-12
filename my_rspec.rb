require 'rspec'
require './kirill'


RSpec.describe ArrayManipulator do
  describe "Создание массива" do
    it "Создаст пустой массив" do
      manipulator = ArrayManipulator.new

      expect(manipulator.create_array).to eq([])
    end

    it "Создаст массив из 10-и элементов" do
      manipulator = ArrayManipulator.new

      expect(manipulator.create_array(10).size).to eq(10)
    end

    it "Создаст массив из 5-и элементов" do
      manipulator = ArrayManipulator.new

      expect(manipulator.create_array(5).size).to eq(5)
    end

    it "Создаст массив из 5-и элементов типа Integer" do
      int_array = ArrayManipulator.new.create_array(5)

      expect(int_array.size).to eq(5)

      int_array.each do |elem|
        expect(elem.is_a? Integer).to eq(true)
      end
    end

    it "Создаст массив из 10-и элементов типа Float" do
      int_array = ArrayManipulator.new.create_array(10, 0.0..10.0)

      expect(int_array.size).to eq(10)

      int_array.each do |elem|
        expect(elem.is_a? Float).to eq(true)
      end
    end
  end
end
