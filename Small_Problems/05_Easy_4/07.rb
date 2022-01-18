DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
           '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_integer(string)
  number = 0
  string.reverse.split('').each_with_index do |digit, index|
    number += DIGITS[digit] * 10 ** index
  end
  number
end

p string_to_integer('4321')
p string_to_integer('570')

# Further Exploration
DIGITS_HEX = { '0' => 0, '1' => 1, '2' => 2, '3' => 3,
               '4' => 4, '5' => 5, '6' => 6, '7' => 7,
               '8' => 8, '9' => 9, 'A' => 10, 'B' => 11,
               'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15 }

def hexadecimal_to_integer(string)
  number = 0
  string.reverse.split('').each_with_index do |digit, index|
    number += DIGITS_HEX[digit.upcase] * 16 ** index
  end
  number
end

p hexadecimal_to_integer('4D9f')
