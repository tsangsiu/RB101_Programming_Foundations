def valid_series?(nums)                     # 1
  return false if nums.sum != 47            # 2
                                            # 3
  odd_count = nums.count { |n| n.odd? }     # 4
  odd_count = 3 ? true : false              # 5
end                                         # 6

=begin

The bug occurs on line 5. On that line, we would like to check if there are 3
odd numbers in `nums`. To check, we should use `==` instead of `=`. As 
assignment statements always return the assigned value, which is `3` in this 
case. And as `3` is truthy, line 5 always returns `true`.

To fix that, simply replace `=` with `==`.

=end

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])     # should return true
p valid_series?([1, 12, 2, 5, 16, 6])          # should return false
p valid_series?([28, 3, 4, 7, 9, 14])          # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])     # should return true
p valid_series?([10, 6, 19, 2, 6, 4])          # should return false

=begin

# Further Exploration

As `odd_count == 3` returns a Boolean value, the ternary operation on line 5
isn't really necessary.

=end
