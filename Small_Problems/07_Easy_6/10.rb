# right angle at bottom right
def triangle_bottom_right(n)
  0.upto(n) do |layer|
    number_of_star = layer
    number_of_space = n - layer
    puts "#{' ' * number_of_space}#{'*' * number_of_star}"
  end
end

# right angle at top right
def triangle_top_right(n)
  0.upto(n) do |layer|
    number_of_star = n - layer
    number_of_space = layer
    puts "#{' ' * number_of_space}#{'*' * number_of_star}"
  end
end

# right angle at top left
def triangle_top_left(n)
  0.upto(n) do |layer|
    number_of_star = n - layer
    number_of_space = layer
    puts "#{'*' * number_of_star}#{' ' * number_of_space}"
  end
end

# right angle at bottom left
def triangle_bottom_left(n)
  0.upto(n) do |layer|
    number_of_star = layer
    number_of_space = n - layer
    puts "#{'*' * number_of_star}#{' ' * number_of_space}"
  end
end

triangle_bottom_right(5)
triangle_top_right(5)
triangle_bottom_left(5)
triangle_top_left(5)
