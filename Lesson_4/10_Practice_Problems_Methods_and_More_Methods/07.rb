p ([1, 2, 3].any? do |num|
  puts num
  num.odd?
end)

=begin

The block's return values are true, false and true respectively for each element
in the array. They are determined by the last expression of the block.

The any? method returns true if the block returns a truthy value for any element
in the calling object, and false if otherwise. In this case, therefore, the
above code returns true.

=end
