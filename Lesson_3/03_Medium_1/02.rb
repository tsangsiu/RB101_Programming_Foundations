# puts "the value of 40 + 2 is " + (40 + 2)

=begin
The above statement will raise an error because String and Integer can't be
added together.
=end

puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"
