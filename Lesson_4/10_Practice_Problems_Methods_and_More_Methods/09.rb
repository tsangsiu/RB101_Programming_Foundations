p ({ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end)

=begin

The return of map is [nil, "bear"].

The map method transforms each element in a collection based on the return value
of the block. For the first key-value pair, the block's return value is nil. For
the second key-value pair, the block's return value is 'bear'. Therefore the map
method returns a new array [nil, "bear"].

=end
