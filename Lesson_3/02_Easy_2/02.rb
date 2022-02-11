munsters_description = "The Munsters are creepy in a good way."
munsters_description = munsters_description.split('').map do |letter|
  letter =~ /[a-z]/ ? letter.upcase : letter.downcase
end.join('')
p munsters_description

munsters_description = "The Munsters are creepy in a good way."
munsters_description = munsters_description.swapcase
p munsters_description


munsters_description = "The Munsters are creepy in a good way."
munsters_description = munsters_description.capitalize
p munsters_description

munsters_description = "The Munsters are creepy in a good way."
munsters_description = munsters_description.downcase
p munsters_description

munsters_description = "The Munsters are creepy in a good way."
munsters_description = munsters_description.upcase
p munsters_description
