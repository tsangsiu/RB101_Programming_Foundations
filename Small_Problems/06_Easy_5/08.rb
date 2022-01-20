ALPHABETIC_NUMBER = %w(zero one two three four
  five six seven eight nine
  ten eleven twelve thirteen fourteen
  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(array)
  array.sort_by do |number|
    ALPHABETIC_NUMBER[number]
  end
end

p alphabetic_number_sort((0..19).to_a)

# Further Exploration
def alphabetic_number_sort(number_array)
  alphabetic_number_array = number_array.map do |number|
    ALPHABETIC_NUMBER[number]
  end
  alphabetic_number_array = alphabetic_number_array.sort
  alphabetic_number_array.map do |alphabetic_number|
    ALPHABETIC_NUMBER.index(alphabetic_number)
  end
end

p alphabetic_number_sort((0..19).to_a)
