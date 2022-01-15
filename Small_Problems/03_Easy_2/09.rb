name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

=begin
The above code will print 'BOB' and 'BOB'.

On line 1, the local variable name is assigned to the string 'Bob'.

On line 2, the local variable save_name is assigned to the string that name is 
referencing, which is the same string 'Bob'.

At this time, both local variables name and save_name point to the same String 
object 'Bob'.

On line 3, the local variable name is modified in place. This affects both the 
local variables name and save_name.
=end
