numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

=begin
The above code will print:
1
2
2
3

Because Array#uniq doesn't mutate the caller, the object that the local variable
numbers points remains as it is.
=end
