# the following only works for both boolean values
# 'a' ^ false => error (undefined method)
# false ^ 'a' => true
def xor?(boolean1, boolean2)
  boolean1 ^ boolean2
end

def xor?(value1, value2)
  return true if !value1 && value2
  return true if value1 && !value2
  false
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# Further Exploration
=begin
The xor operation does not perform short-circuit evaluation. It is because the
xor operation returns true if exactly one of its arguments is truthy. The 
operator has to check both arguments in order to ensure the return value.
=end
