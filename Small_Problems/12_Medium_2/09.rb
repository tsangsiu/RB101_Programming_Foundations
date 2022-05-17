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

# Another Algorithm (Without Using `sort`)
- Loop
  - Set `swapped` to `false`
  - From index position 0 to array.size - 2,
    - If the current element is greater than the next one,
      - Swap the two elements
      - Set `swapped` to `true`
  - Break the loop if `swapped` == `false`
- Return the Array

=end

def bubble_sort!(array)
  until array == array.sort
    0.upto(array.size - 2) do |index|
      array[index], array[index + 1] = array[index + 1], array[index] if array[index] > array[index + 1]
    end
  end
  array
end

def bubble_sort!(array)
  loop do
    swapped = false
    0.upto(array.size - 2) do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        swapped = true
      end
    end
    break if swapped == false
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
