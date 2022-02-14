def fibonacci_last(n)
  first, second = [1, 1]

  3.upto(n) do |_|
    first, second = [second, (first + second) % 10]
  end
  
  second
end

p fibonacci_last(15)
p fibonacci_last(20)
p fibonacci_last(100)
p fibonacci_last(100_001)
p fibonacci_last(1_000_007)
p fibonacci_last(123456789)
