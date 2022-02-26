# illustrate the concept of 'binding'

# A binding is something that contains references to any variables that were in scope at the point where it was created

require 'pry'

a = 1
b = 2
binding.pry
c = 3
