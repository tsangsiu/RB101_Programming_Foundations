=begin

# Problem
- Given three angles,
  - Determine if they can form a valid triangle
  - If yes,
    - Determine if they form an acute, right or obtuse triangle

# Example
triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid

# Algorithm
- A method to determine if the angles can form a valid triangle
  - If the sum of the angles is 180 degrees and all are greater than 0 degrees,
    - Return true
  - Else,
    - Return false

- The `triangle` method
  - If the given angles can form a valid triangle,
    - If one of the angles is 90 degrees,
      - Return :right
    - If one of the angles is greater than 90 degrees,
      - Return :obtuse
    - Else,
      - Return :acute
  - Else,
    - Return false

=end

# Code
def valid_triangle?(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  angles.sum == 180 && angles.min > 0
end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  if valid_triangle?(*angles)
    case
    when angles.include?(90) then :right
    when angles.max > 90     then :obtuse
    else                          :acute
    end
  else
    :invalid
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
