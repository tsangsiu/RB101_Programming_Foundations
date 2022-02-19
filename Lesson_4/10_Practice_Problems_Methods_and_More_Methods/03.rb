p ([1, 2, 3].reject do |num|
  puts num
end)

=begin

The return value of the above code is [1, 2, 3].

The reject methods removes elements in an array based on the truthiness of the
return value of the block, and returns a new array.

In the code above, the returns value is nil, which is falsy for every elements
in the array. Therefore, none of the elements are removed, hence returning a new
array [1, 2, 3].

=end
