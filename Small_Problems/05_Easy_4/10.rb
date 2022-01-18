DIGITS_CHAR = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
                5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

def integer_to_string(integer)
  string = []
  loop do
    quot, mod = integer.divmod(10)
    string.unshift(DIGITS_CHAR[mod])
    integer = quot
    break if integer == 0
  end
  string.join
end

def signed_integer_to_string(integer)
  if integer < 0
    "-#{integer_to_string(-integer)}"
  elsif integer == 0
    "0"
  else
    "+#{integer_to_string(integer)}"
  end
end

# Further Exploration
def signed_integer_to_string(integer)
  string = integer < 0 ? -integer : integer
  string = integer_to_string(string)
  if integer < 0
    "-#{string}"
  elsif integer > 0
    "+#{string}"
  else
    string
  end
end

p signed_integer_to_string(4321)
p signed_integer_to_string(-123)
p signed_integer_to_string(0)
