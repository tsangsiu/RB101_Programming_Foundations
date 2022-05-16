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

p merge_sort([9, 5, 7, 1]) #== [1, 5, 7, 9]
p merge_sort([5, 3]) #== [3, 5]
p merge_sort([6, 2, 7, 1, 4]) #== [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) #== [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
