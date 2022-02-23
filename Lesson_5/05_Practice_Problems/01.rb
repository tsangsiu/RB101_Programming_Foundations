arr = ['10', '11', '9', '7', '8']

arr_sorted = arr.sort_by do |element|
  element.to_i
end.reverse

arr_sorted = arr.sort do |num1, num2|
  num2.to_i <=> num1.to_i
end
