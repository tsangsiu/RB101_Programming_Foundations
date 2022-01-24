def include?(array, target)
  array.each do |element|
    return true if element == target
  end
  false
end

def include?(array, target)
  !!array.find_index(target)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
