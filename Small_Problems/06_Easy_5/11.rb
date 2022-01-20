=begin
The returned string will be a different object.

After the method invocation of #spin_me with an argument 'hello world', the 
local variable str is assigned to the string 'hello world'. On line 2, the 
method #each is called on str.split, which is a different object to str. 
Therefore, subsequent lines of code will not mutate str.
=end

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

str = "hello world"
puts str.object_id
puts spin_me(str).object_id
