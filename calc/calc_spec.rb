require './calc'
require 'rspec'


RSpec.describe Calc do
  describe "Арифметическая сумма" do
    it "Возвращает 0, если нет аргументов" do
      expect(Calc.new.sum).to eq(0)
    end

    it "Суммирует 1 целое число" do
      expect(Calc.new.sum(2)).to eq(2)
    end

    it "Суммирует 2 целых числа" do
      expect(Calc.new.sum(2, 2)).to eq(4)
    end

    it "Суммирует 2 дробных числа" do
      expect(Calc.new.sum(2.0, 2.0)).to eq(4.0)
    end

    it "Суммирует 2 сложных дробных числа" do
      expect(Calc.new.sum(2.9999999, 2.88888888999)).to eq(5.88888878999)
    end

    it "Суммирует 1 целое и 1 дробное число" do
      expect(Calc.new.sum(1, 2.88888888999)).to eq(3.88888888999)
    end

    it "Суммирует 3 целых числа" do
      expect(Calc.new.sum(1, 1, 1)).to eq(3)
    end

    it "Суммирует 5 целых числа" do
      expect(Calc.new.sum(1, 1, 1, 1, 1)).to eq(5)
    end

    it "Суммирует n целых числа" do
      expect(Calc.new.sum(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)).to eq(13)
    end
  end

  describe "Арифметическая разница" do
    it "Отнимет 2 целых числа" do
      expect(Calc.new.raz(3, 2)).to eq(1)
    end

    it "Отнимет 2 целых числа где первое меньше второго" do
      expect(Calc.new.raz(10, 80)).to eq(-70)
    end

    it "Отнимет 2 дробных числа" do
      expect(Calc.new.raz(2.0, 2.0)).to eq(0.0)
    end

    it "Отнимет 2 сложных дробных числа" do
      expect(Calc.new.raz(2.9999999, 2.88888888999)).to eq(0.11111101001000012)
    end
  end

  describe "Арифметическае умножение" do
    it "Умножает 2 целых числа" do
      expect(Calc.new.ymn(5, 5)).to eq(25)
    end

    it "Делит 2 дробных числа числа" do
      expect(Calc.new.ymn(10.00000, 2.00000)).to eq(20)
    end

    it "Делит n целых числа числа" do
      expect(Calc.new.ymn(2,4,4,6,7,5)).to eq(6720)
    end
  end

  describe "Арифметическае деление" do
    it "Делит 2 целых числа" do
      expect(Calc.new.del(6, 2)).to eq(3)
    end

    it "Делит 2 дробных числа числа" do
      expect(Calc.new.del(5.0, 3.0)).to eq(1.6666666666666667)
    end

    it "Делит 2 дробных числа числа" do
      expect(Calc.new.del(50.65, 6.456)).to eq(7.845415117719949)
    end

    it "поделить 2 целых числа" do
      expect(Calc.new.del(0, 1)).to eq(0)
    end

    it "поделить 2 целых числа" do
      expect(Calc.new.del(1, 0)).to eq "Нельзя делить на ноль"
    end
  end

  describe ""
end
# describe "Арифметическая разница" do
#   it "Отнимет 2 целых числа" doDD
#     expect(Calc.new.raz(3, 2)).to eq(1)
#   end
#
#   it "Отнимет 2 целых числа где первое меньше второго" do
#     expect(Calc.new.raz(10, 80)).to eq(-70)
#   end
#
#   it "Отнимет 2 дробных числа" do
#     expect(Calc.new.raz(2.0, 2.0)).to eq(0.0)
#   end
#
#   it "Отнимет 2 сложных дробных числа" do
#     expect(Calc.new.raz(2.9999999, 2.88888888999)).to eq(0.11111101001000012)
#   end
# end

