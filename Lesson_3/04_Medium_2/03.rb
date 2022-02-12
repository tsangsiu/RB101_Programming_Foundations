def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # => "pumpkins"
puts "My array looks like this now: #{my_array}" # => ["pumpkins", "rutabaga"]

=begin
The method tricky_method is invoked with arguments my_string and my_array on 
line 8.

Inside the method, my_string is re-assigned to a new string "pumpkinsrutabaga",
the string that my_string originially points to is not mutated as re-assignment
is not destructive. And, as method definition has a self-defined scope, outside
the method definition on line 10, my_string is still pointing to the string
"pumpkins".

However, inside the method, my_array is modified in place to
["pumpkins", "rutabaga"] as Array#<< is a destructive method. Therefore on 
line 11, although my_array points to the same array object, it is mutated.
=end
