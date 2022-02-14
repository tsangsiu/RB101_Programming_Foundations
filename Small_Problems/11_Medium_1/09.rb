def fibonacci(n)
  fibonacci_array = [0, 1, 1]
  if n == 1 || n == 2
    fibonacci_array[n]
  else
    3.upto(n) do |i|
      fibonacci_array << fibonacci_array[i - 2] + fibonacci_array[i - 1]
    end
    fibonacci_array[n]
  end
end

p fibonacci(20)
p fibonacci(100)
p fibonacci(100_001)
