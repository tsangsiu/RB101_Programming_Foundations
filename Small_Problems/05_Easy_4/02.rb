def ordinal_number_suffix(number)
  return 'th' if [11, 12, 13].include?(number % 100)
  last_digit = number % 10
  return 'st' if last_digit == 1
  return 'nd' if last_digit == 2
  return 'rd' if last_digit == 3
  'th'
end

def century(year)
  century = (year - 1) / 100 + 1
  suffix = ordinal_number_suffix(century)
  "#{century}#{suffix}"
end

puts century(2000)
puts century(2001)
puts century(1965)
puts century(256)
puts century(5)
puts century(10103)
puts century(1052)
puts century(1127)
puts century(11201)
