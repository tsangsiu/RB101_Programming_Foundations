def stringy(number)
  ('10' * number)[0...number]
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Further Exploration
def stringy(number, start = 1)
  ('01' * number)[start, number]
end

def stringy(number, start_with = 1)
  ('01' * number)[start_with...(start_with + number)]
end

puts stringy(9)
puts stringy(9, 0)
puts stringy(4, 0)
