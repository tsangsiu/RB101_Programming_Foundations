=begin

When the stored password is `nil`, the user is prompted to set the password. The
password is then assigned to the local variable `password`.

However, method defintion has a self-contained scope. Variables referenced in it
have to be either passed into it or initialized inside it. And, if we want to
use the return value by a method, we should assign the return value to a local
variable too.

=end

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)
