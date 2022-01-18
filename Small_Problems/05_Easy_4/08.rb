DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
           '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_signed_integer(string)
  number = 0
  string.reverse.split('').each_with_index do |digit, index|
    if digit =~ /[0-9]/
      number += DIGITS[digit] * 10 ** index
    else
      number *= -1 if digit == '-'
    end
  end
  number
end

# Attempt 2
def string_to_integer(string)
  number = 0
  string.reverse.split('').each_with_index do |digit, index|
    number += DIGITS[digit] * 10 ** index
  end
  number
end

def string_to_signed_integer(string)
  case string[0]
  when '+' then tring_to_integer(string[1..])
  when '-' then -string_to_integer(string[1..])
  else          string_to_integer(string)
  end
end

# Further Exploration
def string_to_signed_integer(string)
  first_char = string[0]
  number = ['+', '-'].include?(first_char) ? string[1..] : string
  number = string_to_integer(number)
  first_char == '-' ? -number : number
end

p string_to_signed_integer('4321')
p string_to_signed_integer('-570')
p string_to_signed_integer('+100')
