# [0, 1, 2, 3, 4]; middle_index = (5 - 1) / 2 = 2
# [0, 1, 2, 3, 4, 5]; middle_index = (6 - 1) / 2 = 2.5

def reverse!(array)
  middle_index = (array.length - 1).to_f / 2
  index = 0
  while index < middle_index
    array[index], array[array.length - 1 - index] = array[array.length - 1 - index], array[index]
    index += 1
  end
  array
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true
