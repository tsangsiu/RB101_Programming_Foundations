array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin
The above code will print:
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo

On line 3, the method each is invoked on array1. Every String object in array1 
is pushed to array2. At this time, although array1 and array2 are two 
different arrays (they have different object IDs), they have an identical set
of String objects.

On line 4, the same method is invoked on array1. This time, String objects
which start with a 'C' or 'S' are mutated. As array1 and array2 contain the
identical set of String objects, the mutation affects both array1 and array2,
which explains the output.
=end
