arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = arr.select do |hash|
  keep = true
  hash.each_value do |array|
    array.each do |element|
      keep = false if element.odd?
    end
  end
  keep
end

p new_arr
