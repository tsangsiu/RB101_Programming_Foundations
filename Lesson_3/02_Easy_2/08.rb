advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!(0...advice.index('house'))
p advice

=begin
If the String#slice method is used instead, the method will return a new string:
  "Few things in life are as important as ",
and advice is unchanged.
=end
