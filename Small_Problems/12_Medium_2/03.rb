=begin

# Problem
- Given a String,
  - Return a Hash with 3 entries:
  - The % of lowercase letters
  - The % of uppercase letters
  - The % of neither
- Assume that the given String will always contain at least one character

# Examples
p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# Algorithm
- Given a String,
  - Count the number of lowercase letter (by str.count("a-z"))
  - Count the number of uppercase letter (by str.count("A-Z"))
  - Count the number of neither (by str.count("^a-zA-Z"))
- Calculate the respective % of the above counts
- Create the % Hash
- Return the Hash

=end

# Code
def letter_percentages(str)
  letter_percentages = {}
  letter_percentages[:lowercase] = str.count("a-z")*100.0 / str.length
  letter_percentages[:uppercase] = str.count("A-Z")*100.0 / str.length
  letter_percentages[:neither] = str.count("^a-zA-Z")*100.0 / str.length
  letter_percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# Further Exploration

def letter_percentages(str)
  letter_percentages = {}
  letter_percentages[:lowercase] = format("%.1f", str.count("a-z")*100.0 / str.length)
  letter_percentages[:uppercase] = format("%.1f", str.count("A-Z")*100.0 / str.length)
  letter_percentages[:neither] = format("%.1f", str.count("^a-zA-Z")*100.0 / str.length)
  letter_percentages
end

p letter_percentages('abcdefGHI')
