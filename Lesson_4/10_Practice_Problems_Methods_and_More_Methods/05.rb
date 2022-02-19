hash = { a: 'ant', b: 'bear' }
p hash.shift

=begin

Based on the Ruby documentation, Hash#shift destructively removes the first hash
entry and returns it as a two-item array.

In this case, the above code returns [:a, "ant"]
  
=end
