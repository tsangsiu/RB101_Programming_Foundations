def reverse(array)
  output = []
  array.each do |element|
    output.unshift(element)
  end
  output
end

# Further Exploration
def reverse(array)
  array.inject([]) { |output, element| output.unshift(element) }
end

def reverse(array)
  array.each_with_object([]) { |element, output| output.unshift(element) }
end

p reverse([1,2,3,4]) == [4,3,2,1]
p reverse(%w(a b e d c)) == %w(c d e b a)
p reverse(['abc']) == ['abc']
p reverse([]) == []

list = [1, 3, 2]
new_list = reverse(list)
p list.object_id != new_list.object_id
p list == [1, 3, 2]
p new_list == [2, 3, 1]
