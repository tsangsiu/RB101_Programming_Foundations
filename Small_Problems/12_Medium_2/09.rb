=begin

# Problem
- Implement the bubble sort
- Destructive

# Examples
array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Algorithm
- Until the given Array is sorted,
  - Iterate from the first element to the second-last element,
    - Considering the current element and the next element,
    - If the current element is 'larger' than the next (using the `<=>` method),
      - Exchange those two elements
- Return the given Array

=end

def bubble_sort!(array)
  until array == array.sort
    0.upto(array.size - 1) do |index|
      array[index], array[index + 1] = array[index + 1], array[index] if (array[index] <=> array[index + 1]) == 1
    end
  end
  array
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
