vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)
  count = Hash.new(0)
  array.each do |element|
    count[element] += 1
  end

  count.each do |key, value|
    puts "#{key} => #{value}"
  end
end

# Further Exploration
def count_occurrences(array)
  count = {}

  array.map(&:downcase).uniq.each do |element|
    count[element] = array.map(&:downcase).count(element)
  end

  count.each do |element, count|
    puts "#{element} => #{count}"
  end
end

count_occurrences(vehicles)
