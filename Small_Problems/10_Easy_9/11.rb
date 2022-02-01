words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

hash = Hash.new([]) # same array object, not working
hash = Hash.new

words.each do |word|
  id = word.split('').sort
  hash[id] = [] if !hash.key?(id)
  hash[id] << word
end

groups = []
hash.each_value do |group|
  groups << group
end

groups.each do |group|
  p group
end
