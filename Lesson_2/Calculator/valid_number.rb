def valid_number?(num)
  # need num != '.', or else it matches a single period
  !!(num =~ /^(\+|-)?\d*\.?\d*$/ && num != '.')
end

p valid_number?('0')
p valid_number?('1.')
p valid_number?('0.0')
p valid_number?('+123')
p valid_number?('0.1')
p valid_number?('-123')
p valid_number?('-123.')
p valid_number?('-1.23')
p valid_number?('-.123')
p valid_number?('-123.')
p valid_number?('99999.000001')
p valid_number?('-99999.0000001')
p valid_number?('5.10')
p valid_number?('-0')
p valid_number?('-0.0')
p valid_number?('-0.1')
p valid_number?('.') # false
