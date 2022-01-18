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

p integer_to_string(4321)
p integer_to_string(0)
p integer_to_string(5000)
