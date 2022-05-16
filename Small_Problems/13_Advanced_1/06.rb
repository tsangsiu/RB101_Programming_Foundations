def my_method(array)
  if array.empty?
    []
  elsif array.size != 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([]) #== []
p my_method([3]) #== [21]
p my_method([3, 4]) #== [9, 16]
p my_method([5, 6, 7]) #== [25, 36, 49]

=begin

The condition for the `elsif` is missing on the same line. The Ruby parser then
goes on to the next line to find the evaulated expression, which is the method
invocation of `map` on `array` with the block as an argument. As the `map` 
method always returns an Array, which is truthy, the `elsif` block is
evaluated. As the method invocation of `map` on `array` with the block as an
argument is already taken as a condition, the `elsif` block is empty. Hence, the
method `my_method` returns `nil` for Arrays of size greater than 1.

=end
