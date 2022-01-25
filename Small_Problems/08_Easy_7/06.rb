def staggered_case(string)
  letters = string.split('')
  upcase = true
  letters.each_with_index do |letter, index|
    if letter =~ /[A-Za-z]/
      if upcase
        letters[index] = letter.upcase
      else
        letters[index] = letter.downcase
      end
      upcase = !upcase
    end
  end
  letters.join
end

# Further Exploration
def staggered_case(string, first_char_downcase = false)
  letters = string.split('')
  first_char_downcase ? downcase = false : upcase = true
  letters.each_with_index do |letter, index|
    if letter =~ /[A-Za-z]/
      if upcase
        letters[index] = letter.upcase
      else
        letters[index] = letter.downcase
      end
      upcase = !upcase
    end
  end
  letters.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!', true)
p staggered_case('ALL_CAPS', true)
p staggered_case('ignore 77 the 444 numbers', true)
