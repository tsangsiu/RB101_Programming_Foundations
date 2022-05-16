=begin

# Problem
- Given two sorted Arrays, merge and sort them
- Not allowed to use any sort methods
- Build the result Array one element at a time
- Do not mutate the given Arrays

# Examples
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

# Algorithm
- Initialize `merged_arr` to an empty Array
- Create a duplicate of the given Arrays
- While both duplicated Arrays are not empty,
  - If either duplicated Array is empty, keep shifting the other duplicated Array
  - Else,
    - Compare the first elements in both duplicated Arrays
    - Shift the smaller one
    - Push the element to `merged_arr`
- Return `merged_arr`

=end

def merge(arr1, arr2)
  merged_arr = []
  arr1_dup = arr1.dup
  arr2_dup = arr2.dup
  until arr1_dup.empty? && arr2_dup.empty? do
    if arr2_dup.empty?
      merged_arr << arr1_dup.shift
    elsif arr1_dup.empty?
      merged_arr << arr2_dup.shift
    elsif arr1_dup.first < arr2_dup.first
      merged_arr << arr1_dup.shift
    else
      merged_arr << arr2_dup.shift
    end
  end
  merged_arr
end

=begin

# Another Algorithm
[1, 5, 9] [2, 6, 8]
- Initialize `index2` to `0`, that indicates the element index in the second Array
- Initialize `merged_arr` to an empty Array
- Iterate through the first Array
  - While `index2` is less than the size of `arr2` and `arr2[index2]` is less than the current element,
    - Push `arr2[index2]` to `merged_arr`
    - Increment `index2` by 1
  - Push the current element from the first Array to `merged_arr`
- Push the remaining elements from the second Array to `merged_arr`
- Return `merged_arr`

=end

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

p merge([1, 5, 9], [2, 6, 8]) #== [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) #== [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) #== [1, 4, 5]
p merge([1, 4, 5], []) #== [1, 4, 5]
