def print_in_box(message)
  length = message.length
  puts "+#{'-' * (length + 2)}+"
  puts "|#{' ' * (length + 2)}|"
  puts "| #{message} |"
  puts "|#{' ' * (length + 2)}|"
  puts "+#{'-' * (length + 2)}+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

# Further Exploration
# truncate if length > 80
LINE_LIMIT = 80

def print_in_box(message)
  message = message[0...LINE_LIMIT] if message.length > LINE_LIMIT
  length = message.length
  puts "+#{'-' * (length + 2)}+"
  puts "|#{' ' * (length + 2)}|"
  puts "| #{message} |"
  puts "|#{' ' * (length + 2)}|"
  puts "+#{'-' * (length + 2)}+"
end

print_in_box('123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890')

# text-wrapping
def wrap_text(text)
  output = []
  if text.length > LINE_LIMIT
    while text.length > LINE_LIMIT
      output << text[0...LINE_LIMIT]
      text = text[LINE_LIMIT..]
    end
  end
  output << text
end

def print_in_box(message)
  message_wrapped = wrap_text(message)
  number_of_lines = message_wrapped.size
  length = message_wrapped[0].length
  puts "+#{'-' * (length + 2)}+"
  puts "|#{' ' * (length + 2)}|"
  message_wrapped.each_with_index do |line, index|
    if index != number_of_lines - 1 || message.length < LINE_LIMIT
      puts "| #{line} |"
    else
      puts "| #{line}#{' ' * (LINE_LIMIT - line.length)} |"
    end
  end
  puts "|#{' ' * (length + 2)}|"
  puts "+#{'-' * (length + 2)}+"
end

print_in_box('1234567890')
print_in_box('1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890')
print_in_box(' ')
