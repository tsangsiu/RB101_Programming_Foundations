a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

=begin

a -> 2
b -> [5, 8]
arr -> [a, b] = [2, [5, 8]]

a = 2
b = [3, 8]
[4, [3, 8]]

Final Values:
a = 2
b = [3, 8]

=end
