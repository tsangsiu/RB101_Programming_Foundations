def get_grade(*scores)
  mean = scores.sum / scores.size
  grade = if mean >= 90
            "A"
          elsif mean >= 80
            "B"
          elsif mean >= 70
            "C"
          elsif mean >= 60
            "D"
          else
            "F"
          end
  grade
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# Further Exploration
=begin
My original solution can already handle the situation when there are extra
credit grades causing it to exceed 100 points.
=end
