=begin

    *      1
   ***     2
  *****    3
 *******   4
*********  5
 *******   6
  *****    7
   ***     8
    *      9

for line = 1 to 9
  if line <= n / 2
    number_of_star = 2 * line - 1
    number_of_space = (n - number_of_star) / 2
    print ' ' * number_of_space + '*' * number_of_star
  elsif line == (n + 1) / 2
    print '*' * n
  else
    number_of_star = (2 * (n - line + 1) - 1)
    number_of_space = (n - number_of_star) / 2
    print ' ' * number_of_space + '*' * number_of_star
  end
end

=end

def diamond(n)
  for line in 1..n
    if line <= n / 2
      number_of_star = 2 * line - 1
      number_of_space = (n - number_of_star) / 2
      puts "#{' ' * number_of_space}#{'*' * number_of_star}"
    elsif line == (n + 1) / 2
      puts '*' * n
    else
      number_of_star = (2 * (n - line + 1) - 1)
      number_of_space = (n - number_of_star) / 2
      puts "#{' ' * number_of_space}#{'*' * number_of_star}"
    end
  end
end

diamond(1)
puts
diamond(3)
puts
diamond(9)

# Further Exploration

def print_row(number_of_space, number_of_star)
  if number_of_star == 1
    puts "#{' ' * number_of_space}*"
  else
    puts "#{' ' * number_of_space}*#{' ' * (number_of_star - 2)}*"
  end
end

def hollow_diamond(n)
  1.upto((n + 1) / 2) do |line|
    number_of_star = 2 * line - 1
    number_of_space = (n - number_of_star) / 2
    print_row(number_of_space, number_of_star)
  end
  ((n - 1) / 2).downto(1) do |line|
    number_of_star = 2 * line - 1
    number_of_space = (n - number_of_star) / 2
    print_row(number_of_space, number_of_star)
  end
end

hollow_diamond(1)
puts
hollow_diamond(3)
puts
hollow_diamond(5)
puts
hollow_diamond(9)
