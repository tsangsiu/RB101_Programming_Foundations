def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

# todo = ['study', 'walk the dog', 'coffee with Tom']
# done = ['apply sunscreen', 'go to the beach']

# move(2, todo, done)

# p todo # should be: ['coffee with Tom']
# p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

=begin

Basically, `SystemStackError` is similar to an infinite loop.

For recursion, in order to know where it needs to return to after finishing each
of the method calls, RUby puts each call on a call stack. Since we never stop,
this stack keeps growing and growing, until it exceeds its limit. This causes
the `SystemStackError`.

The code attemps to use recursion to do the thing. But the recursion does not
have a base condition to return something. That is, the method keeps calling 
itself, which raises `SystemStackError`.

To resolve the error, we can rewrite the `move` method like this:

=end

def move(n, from_array, to_array)
  return to_array if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

=begin

# Further Exploration

If the length of `from_array` is smaller than `n`, at one point, `from_array` is
empty. When we call `shift` on an empty array, it returns `nil`, which is then
pushed `to_array`.

=end

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(5, todo, done)

p todo
p done # => ['apply sunscreen', 'go to the beach', 'study', 'walk the dog', 'coffee with Tom', nil, nil]
