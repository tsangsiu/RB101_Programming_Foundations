def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Further Exploration
=begin
In my opinion, whether uppercase? should return true for an empty string all 
depends on our definition, as long as it is well-documented.

Just like different programming languages have different definitions of falsy
values. In Ruby, 0 is considered truthy, while in JavaScript, 0 is considered 
falsy.
=end
