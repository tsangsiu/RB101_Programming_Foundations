=begin

# Problem
- stack-and-register programming language
- each operation operates on a register (current value)
- if an operation needs two values, pop the topmost item from the stack
- perform the operation using the popped value and the register value
- store the result back to the register

# Example:
- stack: [3, 6, 4]; register: 7
- consider the multiply operation (MULT)
- pop the stack (and get 4), times the register value 7, to get 28
- now becomes:
- stack: [3, 6]; register: 28

# Data Structures
- Input: a String of programming code
- Intermediate: Array (stack), Integer (register)
- Output: Integer

# Algorithm
- Initialize `register` to `0`
- Initialize `stack` to an empty Array
- Split the given programming code at spaces
- Iterate through the commands
  - If the current command is a number,
    - Push it to the register
  - Else,
    - Do the corresponding operation as stated

=end

# Code
def minilang(lang)
  register = 0
  stack = []
  commands = lang.split
  commands.each do |command|
    if command.to_i.to_s == command
      register = command.to_i
    else
      case command
      when 'PUSH'  then stack << register
      when 'ADD'   then register += stack.pop
      when 'SUB'   then register -= stack.pop
      when 'MULT'  then register *= stack.pop
      when 'DIV'   then register /= stack.pop
      when 'MOD'   then register %= stack.pop
      when 'POP'   then register = stack.pop
      when 'PRINT' then puts register
      end
    end
  end
end

# minilang('PRINT')
# minilang('5 PUSH 3 MULT PRINT')
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# minilang('5 PUSH POP PRINT')
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# minilang('-3 PUSH 5 SUB PRINT')
# minilang('6 PUSH')

=begin

# Further Exploration

# Problem
- Use `minilang` to print the result of the expression:
  - (3 + (4 * 5) - 7) / (5 % 3)

# Brainstorm
- Expressions calculated at last should do first in `minilang` and push the result to the stack
- 5 % 3 -> 3 PUSH 5 MOD PUSH
  - stack: [2], register: 2
- (- 7) -> 7 PUSH
  - stack: [2, 7], register: 7
- 4 * 5 -> 5 PUSH 4 MULT PUSH
  - stack: [2, 7, 20], register: 20
- 3
  - stack: [2, 7, 20], register: 3

=end

minilang('3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 ADD SUB DIV PRINT') # prints 8
