statement = "The Flintstones Rock"

p (statement.chars.each_with_object(Hash.new(0)) do |char, hash|
  hash[char] += 1
end)
