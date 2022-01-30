def center_of(string)
  length_of_string = string.length
  if length_of_string.odd?
    string[(length_of_string - 1) / 2]
  else
    string[(length_of_string / 2 - 1)..(length_of_string / 2)]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
