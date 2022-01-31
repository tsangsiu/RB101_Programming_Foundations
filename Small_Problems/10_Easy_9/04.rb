def sequence(number)
  (1..number).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# Further Exploration
def sequence(number)
  if number.positive?
    (1..number).to_a
  elsif number.negative?
    (number..-1).to_a.reverse
  else
    [0]
  end
end

p sequence(5)
p sequence(-5)
p sequence(0)
