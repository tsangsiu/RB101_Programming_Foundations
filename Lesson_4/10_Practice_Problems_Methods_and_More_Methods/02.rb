p (['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end)

=begin

From the Ruby documentation, we know that the method count calls the block with
each element; returns the count of elements for which the block returns a truthy
value.

In the example above, the count method counts the number of elements in the 
array that the length of string is smaller than 4, which is 2.

=end
