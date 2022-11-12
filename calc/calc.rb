class Calc
  def sum(*numbers)
    sum = 0
    numbers.each { |num| sum += num }
    sum
  end

  def raz(a, b)
    a - b
  end

  def ymn(*numbers)
    ymn = 1
    numbers.each { |num| ymn *= num }
    ymn
  end

  def del(a, b)
    return "Нельзя делить на ноль" if b == 0
    a / b
  end
end