[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

=begin

The above code returns [1, nil, nil].

The map method transforms each element in an array based on the return value of 
the block, and returns a new transformed array.

In the case, for the first element, the last evaluated expression is num, which 
returns the element itself. For the next two elements, the last evaluated 
expression is puts num, which returns nil.

=end
