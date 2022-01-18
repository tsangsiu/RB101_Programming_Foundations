def multisum(number)
  multiples = []
  1.upto(number) do |number|
    multiples << number if number % 3 == 0 || number % 5 == 0
  end
  multiples.sum
end

# Further Exploration
def multisum(number)
  multiples = []
  1.upto(number) do |number|
    multiples << number if number % 3 == 0 || number % 5 == 0
  end
  multiples.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
