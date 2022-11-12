# a = 12
# b = 13.2
#
# a, b = b, a
# # c = a
# # a = b
# # b = c
#
# print "#{a} : #{b}"
#
# #
# def create_array(size = 10, interval = 0..10)
#   array = []
#
#   size.times do
#     array.push(rand(interval))
#   end
#
#   array
# end
#
# def max(array)
#   m = array[0]
#   array.each_with_index do |element, i|
#     if array[i] > m
#       m = array[i]
#     end
#   end
#
#   m
# end
#
# def min(array)
#   mi = array[0]
#   array.each_with_index do |element, k|
#     if array[k] < mi
#       m = array[k]
#     end
#   end
#
#   mi
# end
#
# def odinakovoe(array)
#   new_arr = []
#
#   (array.size - 1).times do |b|
#     if array[b] == array[b + 1]
#       new_arr.push([array[b], array[b + 1]])
#     end
#   end
#
#   new_arr
# end
#
# def print_an(array, step)
#   print "#{step}: #{array}\n"
# end
#
# def sort(array) #bubble sort
#   (array.size - 1).times do
#     (array.size - 1).times do |i|
#       if array[i] > array[i + 1]
#         array[i], array[i + 1] = array[i + 1], array[i]
#       end
#       print_an(array, i)
#     end
#     print "\n"
#   end
#
#   array
# end
#
# def summa(array)
#   sum = 0
#   array.each do |e|
#     sum += array[e]
#   end
#   sum
# end
#
# a = create_array(10, 0..10)
# print "   До: #{a}\n"
#
# a = sort(a)
#
# print "После: #{a}\n"
# print "Максимум: #{max(a)}\n"
# print "Минимум: #{min(a)}\n"
# print "Одинаковое число: #{odinakovoe(a)}\n"
# print "Сумма чисел: #{summa(a)}\n"
class ArrayManipulator
  def initialize
  end

  def create_array(size = 0, interval = 0..10)
    a = []
    size.times do
      a.push(rand(interval))
    end
    a
  end
end
