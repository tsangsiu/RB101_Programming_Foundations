=begin

# Problem
- Write a method to implement the merge sort
- You may use the `merge` method in the previous exercise

# Examples
merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
merge_sort([5, 3]) == [3, 5]
merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

# Algorithm
- If the given Array is of size less than or equal to 1, return it
- Split the given Array into half until it's not splitable
- Use the `merge` method to merge back to a sorted Array

=end

# to merge two sorted Arrays
def merge(arr1, arr2)
  merged_arr = []
  index2 = 0
  arr1.each do |element|
    while index2 < arr2.size && arr2[index2] < element
      merged_arr << arr2[index2]
      index2 += 1
    end
    merged_arr << element
  end  
  merged_arr += arr2[index2..-1]
end

def merge_sort(arr)
  return arr if arr.size == 1
  n = arr.size
  arr1 = arr[0...(n / 2)]
  arr2 = arr[(n / 2)..-1]
  arr1 = merge_sort(arr1)
  arr2 = merge_sort(arr2)
  merge(arr1, arr2)
end

=begin

# Further Exploration

# Problem
- Write a method to implement the merge sort without using Recursion
- You may use the `merge` method in the previous exercise

# Algorithm
- Algorithm to divide an Array until it cannot be further divided
  - Initialize an empty Array called `divided_arr` to store the divided Arrays
  - Initialize `layer` to `0`
  - Append the given Array to `divided_arr`
  - While the last Array in `divided_arr` is not a single-element or empty Array
    - Split the Arrays from index position 2 ** `layer` - 1 to 2 ** (`layer` + 1) - 2
    - Append them in order to `divided_arr`
    - Increment `layer` by 1
    
- Take the sub-Arrays from index position 2 ** `layer` - 1 to 2 ** (`layer` + 1) - 1 from `divided_arr`, and append them to `merged_arr`
- Pass `merged_arr` into the method to do the merge sort

- Algorithm to do the merge sort
  - Given an Array with sub-Arrays of size 0 or 1
    - Find the number of layer by log(Array.size).ceil, and assigned that to `layer` (the given Array is at layer 0)
    - Initialize `start_index` to `0`
    - Initialize `end_index` to 2 ** layer - 1
    - Until `layer` == 0,
      - From `start_index` to `end_index`
        - If the current index is even,
          - Use `merge` to merge the current and the next Arrays
          - Append the result Array to `merged_arr`
      - Decrement `layer` by `1`
      - Set `start_index` to `end_index + 1`
      - Increment `end_index` by `2 ** layer`
    - Return the last Array in `merged_arr`

=end

def divide_arr(arr)
  divided_arr = [arr]
  layer = 0
  while divided_arr.last.size > 1
    (2 ** layer - 1).upto(2 ** (layer + 1) - 2) do |index|
      n = divided_arr[index].size
      first_half = divided_arr[index][0...(n / 2)]
      second_half = divided_arr[index][(n / 2)..]
      divided_arr << first_half << second_half
    end
    layer += 1
  end
  divided_arr
end

def merge_arr(arr)
  merged_arr = arr
  layer = Math.log2(merged_arr.size).ceil
  start_index = 0
  end_index = 2 ** layer - 1
  until layer == 0
    start_index.upto(end_index) do |index|
      merged_arr << merge(merged_arr[index], merged_arr[index + 1]) if index.even?
    end
    layer -= 1
    start_index = end_index + 1
    end_index += 2 ** layer
  end
  merged_arr
end

def merge_sort(arr)
  divided_arr = divide_arr(arr)
  layer = Math.log2(divided_arr.size).floor
  divided_arr = divided_arr[(2 ** layer - 1)..(2 ** (layer + 1) - 1)]
  merge_arr(divided_arr).last
end

p merge_sort([9, 5, 7, 1]) #== [1, 5, 7, 9]
p merge_sort([5, 3]) #== [3, 5]
p merge_sort([6, 2, 7, 1, 4]) #== [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) #== [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
