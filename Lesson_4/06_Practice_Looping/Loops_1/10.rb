friends = ['Sarah', 'John', 'Hannah', 'Dave']

counter = 0
loop do
  puts "Hello, #{friends[counter]}!"
  counter += 1
  break if counter >= friends.size
end
