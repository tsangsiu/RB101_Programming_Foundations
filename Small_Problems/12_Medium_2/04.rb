=begin

# Problem
- Given a String,
  - If all parentheses in it are all balanced, return true, else return false
- To be properly balanced, parentheses must occur in matching '(' and ')' pairs

# Examples
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false

# Algorithm
- Initialize `stack` to an empty Array
- Remove all non-parentheses in the String
- Iterating through the String
  - If the current character is '('
    - Push it to `stack`
  - Else if the current character is ')'
    - If the last element in `stack` is '(',
	    - Remove it from `stack`
  	- Else,
  	  - Return false
- If `stack` is empty,
  - Return true
- Else,
  - Return false

=end

# Code
def balanced?(str)
  stack = []
  str = str.gsub(/[^()]/, '')
  str.each_char do |char|
    if char == '('
      stack << char
    else
      stack.last == '(' ? stack.pop : (return false)
    end
  end
  stack.empty? ? true : false
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# Further Exploration

def curly_bracket_balanced?(str)
  stack = []
  str = str.gsub(/[^()]/, '')
  str.each_char do |char|
    if char == '('
      stack << char
    else
      stack.last == '(' ? stack.pop : (return false)
    end
  end
  stack.empty? ? true : false
end

def square_bracket_balanced?(str)
  stack = []
  str = str.gsub(/[^\[\]]/, '')
  str.each_char do |char|
    if char == '['
      stack << char
    else
      stack.last == '[' ? stack.pop : (return false)
    end
  end
  stack.empty? ? true : false
end

def single_quot_mark_balanced?(str)
  str.count("'").even?
end

def double_quot_mark_balanced?(str)
  str.count('"').even?
end

def balanced?(str)
  curly_bracket_balanced?(str) &&
  square_bracket_balanced?(str) &&
  single_quot_mark_balanced?(str) &&
  double_quot_mark_balanced?(str)
end

p balanced?("'What' [is] (this)?") == true
