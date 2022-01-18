=begin

a method that takes an array of strings, and returns a string that is all those
strings concatenated together

- given an array of strings
- use Array#join to concatenate the strings

START
  # given an array of strings
  SET concatenated_string = array.join(' ')
  RETURN concatenated_string
END

=end

def concatenate_string(array_strings)
  concatenated_string = array_strings.join(' ')
end

p concatenate_string(['I', 'go', 'to', 'school', 'by', 'bus.'])
