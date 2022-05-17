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

=begin

# Further Exploration

# Problem
- Amended the `bubble_sort!` method so that it uses the following optimization:
- Skip looking at the end of the elements that we know are already sorted

# Brainstorm
- [0, 1, 2, 3, 4, 5], size = 6
- For the first pass, from index position 0 to 4 (size - 2 - (#pass - 1))
- For the second pass, from index position 0 to 3 (size - 2 - (#pass - 1))
- ...
- For the n-th pass, from index position 0 to size - #pass - 1

=end

def bubble_sort!(array)
  loop do
    swapped = false
    n_pass = 1
    0.upto(array.size - n_pass - 1) do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        swapped = true
      end
    end
    n_pass += 1
    break if swapped == false
  end
  array
end

=begin

# Further Exploration

# Problem
- Amended the `bubble_sort!` method so that it uses the following optimization:
- Skip looking at the end of the elements that we know are already sorted
- In general, we can skip to check the elements beyond the position where the last swap was performed

=end

def bubble_sort!(array)
  loop do
    swapped = false
    last_swapped_index = array.size - 2
    0.upto(last_swapped_index) do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        swapped = true
        last_swapped_index = index
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

array = (1..100).to_a.shuffle
bubble_sort!(array)
p array == (1..100).to_a
