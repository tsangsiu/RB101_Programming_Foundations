def shout_out_to(name)                        # 1
  name.chars.each { |c| c.upcase! }           # 2
                                              # 3
  puts 'HEY ' + name                          # 4
end                                           # 5
                                              # 6
shout_out_to('you') # expected: 'HEY YOU'     # 7

=begin

Upon the method invocation of `shout_out_to` on line 7 with an argument `'you'`,
the method parameter `name` is assigned to `'you'`.

The method `chars` is then called on `name` which returns a new array 
`['y', 'o', 'u']`. At this point, the local variable `name` still points to
`'you'`.

Therefore, when the `puts` method is called on line 4 with an argument
`'HEY ' + name`, it outputs `HEY you` to the console.

=end

def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you')
