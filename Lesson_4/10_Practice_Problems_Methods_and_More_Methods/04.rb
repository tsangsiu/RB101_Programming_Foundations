p (['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end)

=begin

The above code will return: {'a'=>'ant', 'b'=>'bear', 'c'=>'cat'}

The each_with_object method iterates through every element in the calling object
and does operation as instructed in the block on the arugment passed in to the
method. After the iteration, the method returns the updated object.

In this case, the arugment passed in to the method is an empty hash. For every 
element in the array, it is set that the key is the first letter of the element
and the value is the element itself. Therefore, after finishing iteration, we
have {'a'=>'ant', 'b'=>'bear', 'c'=>'cat'}.

=end
