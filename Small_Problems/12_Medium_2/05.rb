=begin

# Problem
- Given 3 sides, determine:
  - If that's a valid triangle
  - If yes,
    - Determine if it's an equilateral, isosceles or scalene triangle 

# Examples
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# Algorithm
- A method to determine if the three sides can form a triangle:
  - If the sum of any two sides is greater than the third one,
    - Return true
  - Else,
    - Return false

- The `triangle` method:
  - If the 3 sides can form a triangle,
    - If the 3 sides are equal,
      - Return :equilateral
    - Else if 2 sides are equal,
      - Return :isosceles
    - Else,
      - Return :scalene
  - Else,
    - Return :invalid

=end

# Code
def valid_triangle?(side1, side2, side3)
  side1 + side2 > side3 &&
  side2 + side3 > side1 &&
  side3 + side1 > side2
end

def triangle(side1, side2, side3)
  if valid_triangle?(side1, side2, side3)
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side3 == side1
      :isosceles
    else
      :scalene
    end
  else
    :invalid
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
