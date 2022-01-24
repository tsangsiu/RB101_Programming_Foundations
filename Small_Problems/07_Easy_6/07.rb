def halvsies(array)
  [array[0..(array.size - 1) / 2], array[(array.size + 1) / 2..]]
end

p halvsies([1, 2, 3, 4])
p halvsies([1, 5, 2, 4, 3])
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
