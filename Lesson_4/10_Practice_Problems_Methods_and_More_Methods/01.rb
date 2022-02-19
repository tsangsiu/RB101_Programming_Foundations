p ([1, 2, 3].select do |num|
  num > 5
  'hi'
end)

=begin

The return value of the above select method is [1, 2, 3].

The select method selects elements in the array based on the return value of the
block. As the block returns 'hi', which is truthy, for every elements. All 
elements in the array are selected, hence returning [1, 2, 3].

=end
