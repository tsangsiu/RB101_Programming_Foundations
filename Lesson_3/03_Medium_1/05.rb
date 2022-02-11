# limit = 15

# def fib(first_num, second_num)
#   while first_num + second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end

# result = fib(0, 1)
# puts "result is #{result}"

=begin
Inside the method definition of fib, it references the local variable limit. As
method definition has a self-defined scope, all local variables referenced in it
must be defined in the method or passed in as arguments. Therefore there is no
access to the local variable limit in the method definition.

To fix this, we can add an additional argument limit to the fib method, and 
invoke the method again with an additional argument limit.
=end

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"
