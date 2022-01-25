def staggered_case(string)
  letters = string.split('')
  letters.each_with_index do |letter, index|
    if index.even?
      letters[index] = letter.upcase
    else
      letters[index] = letter.downcase
    end
  end
  letters.join
end

# Further Exploration
def staggered_case(string, first_char_downcase = false)
  letters = string.split('')
  letters.each_with_index do |letter, index|
    if (!first_char_downcase && index.even?) || (first_char_downcase && index.odd?)
      letters[index] = letter.upcase
    else
      letters[index] = letter.downcase
    end
  end
  letters.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case('I Love Launch School!', true)
p staggered_case('ALL_CAPS', true)
p staggered_case('ignore 77 the 444 numbers', true)
