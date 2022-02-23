array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_array = []
array.each do |hash|
  new_hash = {}
  hash.each_key do |key|
    new_hash[key] = hash[key] + 1
  end
  new_array << new_hash
end

p array
p new_array
