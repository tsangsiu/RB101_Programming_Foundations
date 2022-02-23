books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

p (books.sort_by do |hash|
  hash[:published]
end)

# How about in descending order?

# does not work, #<=> is not defined on Hash
# books.sort do |hash1, hash2|
#   hash2[:published] <=> hash1[:pushlished]
# end

books.sort_by do |hash|
  hash[:published]
end.reverse
