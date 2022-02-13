def fibonacci(n)
  return 1 if [1, 2].include?(n)
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1)
p fibonacci(2)
p fibonacci(3)
p fibonacci(4)
p fibonacci(5)
p fibonacci(12)
p fibonacci(20)
